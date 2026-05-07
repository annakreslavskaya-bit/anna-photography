import galleriesData from '@/data/galleries.json';

export interface GalleryImage {
  src: string;
  alt: string;
}

export interface GalleryInfo {
  slug: string;
  title: string;
  description?: string;
  cover?: GalleryImage;
  hidden?: boolean;
  images: GalleryImage[];
}

const imageExtensions = /\.(jpg|jpeg|png|webp|svg|avif|gif)$/i;

/**
 * Read all images from a gallery folder under src/content/galleries/<slug>/.
 * Files are sorted by filename, so prefix images with numbers (01-, 02-, ...) to control order.
 */
function getGalleryImages(slug: string): GalleryImage[] {
  const allImages = import.meta.glob<{ default: ImageMetadata }>(
    '/src/content/galleries/**/*.{jpg,jpeg,png,webp,svg,avif,gif}',
    { eager: true }
  );

  const galleryPrefix = `/src/content/galleries/${slug}/`;
  const entries: { filePath: string; image: GalleryImage }[] = [];

  for (const [path, mod] of Object.entries(allImages)) {
    if (path.startsWith(galleryPrefix)) {
      const filename = path.split('/').pop() || '';
      if (imageExtensions.test(filename)) {
        entries.push({
          filePath: path,
          image: {
            src: typeof mod.default === 'string' ? mod.default : mod.default.src,
            // Auto-generate alt text from filename: "01-sunset-over-water.jpg" -> "01 sunset over water"
            alt: filename.replace(/\.[^.]+$/, '').replace(/[-_]/g, ' '),
          },
        });
      }
    }
  }

  entries.sort((a, b) => {
    const nameA = a.filePath.split('/').pop() || '';
    const nameB = b.filePath.split('/').pop() || '';
    return nameA.localeCompare(nameB, undefined, { numeric: true });
  });

  return entries.map((e) => e.image);
}

function buildGallery(gallery: (typeof galleriesData.galleries)[number]): GalleryInfo {
  const images = getGalleryImages(gallery.slug);
  const coverFile = (gallery as any).cover as string | undefined;
  const cover = coverFile
    ? images.find((img) => img.src.includes(coverFile)) ?? images[0]
    : images[0];
  return {
    slug: gallery.slug,
    title: gallery.title,
    description: gallery.description,
    hidden: (gallery as any).hidden ?? false,
    cover,
    images,
  };
}

export function getAllGalleries(): GalleryInfo[] {
  return galleriesData.galleries.map(buildGallery);
}

export function getVisibleGalleries(): GalleryInfo[] {
  return getAllGalleries().filter((g) => !g.hidden);
}

export function getGallery(slug: string): GalleryInfo | undefined {
  return getAllGalleries().find((g) => g.slug === slug);
}

export function getSiteConfig() {
  return galleriesData.site;
}
