#!/usr/bin/env bash
set -euo pipefail
BASE="https://images.squarespace-cdn.com/content/v1/660b11033399a85bde0f4745"
DEST="$HOME/Documents/anna-photography/src/content/galleries"

dl() {
  local dir="$1" uuid="$2" file="$3"
  local out="$DEST/$dir/$file"
  if [[ -f "$out" ]]; then return; fi
  curl -sL --retry 3 --retry-delay 1 "$BASE/$uuid/$file" -o "$out" && echo "OK  $dir/$file" || echo "ERR $dir/$file"
}

# ── Creative Portraits ────────────────────────────────────────────────────────
dl creative-portraits 8f558f1c-0e59-4c77-8ebe-12cebe9183e3 Margo-21.jpg
dl creative-portraits e94300f6-36f4-49d8-a237-2f1aa007b99f AnnaFire-4.jpg
dl creative-portraits 3344db3d-710f-41c4-b8cd-accb3394c802 IMG_7875.jpg
dl creative-portraits 08e0975b-0f97-45c1-bcd3-578bb52e381b JB-27.jpg
dl creative-portraits 770aaf71-c675-4d4e-9880-d44e317af9b3 JB-28.jpg
dl creative-portraits d03123ce-1cd3-405d-a7cd-45e6cc058c81 LidiaBW-5.jpg
dl creative-portraits 507652b1-108f-4577-8702-93f7fff5deab LB_mirror-1.jpg
dl creative-portraits b2781168-f3db-4f19-8a49-52e6fca1e1b5 Kaz-7.jpg
dl creative-portraits f2fcb895-4998-48e4-8beb-96509b17bcef Kazu-3.jpg
dl creative-portraits b454a722-1cfe-48f5-b3a8-28775f961d3a Kaz-4.jpg
dl creative-portraits 99a7a1a5-7104-485f-a0d2-78ab3f90e39c Natasha-4.jpg
dl creative-portraits d67c814d-ee73-497c-b823-f4ab1d435c63 IMG_4033.CR2.jpg
dl creative-portraits 531a878d-262c-4855-88c3-f6b8d53bb1d2 DS-24.jpg
dl creative-portraits 36940c04-fca7-43b1-b25e-4266a3b2b042 "EJ+Anna-1.jpg"
dl creative-portraits e84c2b20-23df-4287-b61d-49a04a82ba6d SergeDE-3.jpg
dl creative-portraits 6719c598-7823-4b8f-b092-c1da33a10683 CC-59.jpg
dl creative-portraits 35f5a70d-2872-4193-9c36-afb60c12c597 Yegor_April_2024-65.jpg
dl creative-portraits b0d27ade-da1d-4a77-a215-9887be69fc47 ExpSoun-5.JPG
dl creative-portraits 1e28673f-73ae-4642-b265-d5805bfa09e8 "LB_bardak+bw-1.jpg"
dl creative-portraits 690e6891-77dc-4386-b084-dec9b392ea81 HP-31.jpg
dl creative-portraits 7379f26e-3c14-4169-843b-e732e45ef88a "LB_closed+eyes-1.jpg"
dl creative-portraits 9d69acb0-d57d-47cc-bb5e-afb5e6e87115 "LB_reflection+-3.jpg"
dl creative-portraits c5113ddd-a01e-431b-819a-6130eedb40ee TPAS2024-10.jpg
dl creative-portraits 9e3b679c-ac37-4167-a897-b029664c28cd LidiaBW-7.jpg
dl creative-portraits e9503174-d4f9-4fe8-9b18-0c347acc85c6 Jenna-6.jpg
dl creative-portraits 2d81a55d-effa-43f6-8f91-95c177da7f95 Jenna-5.jpg
dl creative-portraits 1a6b7987-88f0-43ba-adc2-b6cd1eb306aa Jenna-11.jpg

# ── Events ────────────────────────────────────────────────────────────────────
dl events 7db7d471-61ae-4a2d-9fec-76ada3853383 IMG_2901.jpg
dl events 8bf460eb-03dc-4f9d-b54c-abc8ff414c7d IMG_2896.jpg
dl events 4ab1af76-3a65-47e7-a6fd-72b2f770c856 IMG_2760.jpg
dl events 33e6debf-27e8-4ff6-9e70-f3b5114b2c54 Day2-5.jpg
dl events a3829376-2890-452a-beb8-9323ca76ad50 Day3-9.jpg
dl events 4f022d09-811c-4420-893d-f437bffbd546 Day1-18.jpg
dl events c7feb372-8d2b-4d3c-b667-5f10700d23f8 YauBanq-12.jpg
dl events 2d5cee0e-f5a5-4d87-a8ed-11f1b46befc0 YauBanq-49.jpg
dl events c23377b5-39e0-455e-a787-6710834dcd25 BH-5.jpg
dl events cf903acf-85ee-4930-9711-16d36c0bec8f Kaziuki2018-47.jpg
dl events 6925c396-0d06-4fb6-b26f-501f965e858f Ceremony-36.jpg
dl events 56807903-5f3c-4a0e-92f7-2b2615212f4c "Summer+Soltice2021-4.jpg"
dl events 5150c1ac-b206-49ce-9ba8-c539a27f6527 IMG_4434.jpg
dl events aef9c748-bd64-4d9f-9b48-961b744d9e77 IMG_4382.jpg
dl events 9d6118f2-a541-4b0e-b269-424379441867 IMG_4364.jpg
dl events 0dffd713-e11f-4a8b-a931-a808488c64b4 TASP-6.jpg
dl events b14a687a-45dc-46fe-82e9-a1beb56785a9 TASP-13.jpg
dl events ea19a992-bdc6-4196-9dcc-79754600a2be IMG_3272_2.jpg
dl events 35acacc1-b66c-467e-884a-f3bdfd08fa5a IMG_3294_2.jpg
dl events 934dfaeb-9e3d-44ec-9aa8-0fc7c68262a5 16.jpg
dl events 090193b5-0682-41dc-b0be-879c672b35ed "Garrison+wedding+bw+16.jpg"
dl events 111e6ed1-c4a6-4a23-81f3-b65f1fccc5a5 "Garrison+wedding+bw+14.jpg"
dl events 0f22d42f-05de-4ffa-a4b9-ec8957a012be "600x600_1291061722630-AngelaandChrisBW.jpg"
dl events b19d174d-3d36-4f79-bc17-5c00ae72fb47 LM-Wedding-61.jpg
dl events 5e8d7dd3-b8a3-45d4-bbf8-d33745cfba4d TPAS2024-7.jpg

# ── Children ─────────────────────────────────────────────────────────────────
dl children c08a28e9-6051-406e-a948-d5866ccd8a07 Anya-31.jpg
dl children d0bbd449-e05c-48cb-8971-10c1bcfd6aee Anya-24.jpg
dl children 7d1afb82-c7ba-4780-a465-3116d6dc5b3b Margo-11.jpg
dl children 6f9e40cd-4baa-4304-ac9a-74ac6e6ba128 Margo-12.jpg
dl children c86da1de-9f58-491e-912e-7b9549d2c56f 20131102-IMG_6265-1.jpg
dl children 871e4f28-79c0-4a33-9cf2-2495f02e1951 Luc-1.jpg
dl children c014b2b9-d9da-4e6b-93f2-566a9405aa6e Abi-8.jpg
dl children 7f4fc314-39d9-43b7-b92e-ab4c90c3eade Bella-24.jpg
dl children f713bcf7-883e-4f07-8d25-9e423489a52a Sami-16.jpg
dl children 04b9bec5-e33c-402e-aa07-b7b8436b65f8 Friends-11.jpg
dl children 4bd5e035-c8df-4b70-ad67-6cfe9d3871af 20131102-IMG_6341-1.jpg
dl children cf87f03c-d18e-4350-b02a-36155ba04bf6 Ben.jpg
dl children 131f6f69-4399-41ea-a2ac-e910aa571c38 "Florida+(2+of+16).jpg"
dl children e7aaa8a6-ffee-4578-8690-6306003661ab Marina10-4.jpg
dl children b8f704d8-6e85-40ca-8e62-8252f3fbb626 "Prom+Burke+2023-108.jpg"
dl children 458c8f45-9a47-443d-9123-7a9639a8bd79 Kazu-32.jpg
dl children 07b0cfd1-be76-4968-b2d7-9aac78c24540 Margo-17.jpg
dl children 147f8d14-2285-42e2-848e-4cba46296bbe Anya-62.jpg
dl children b3345aca-c4ec-4ea1-abcd-1c2d855aaf97 Anya-61.jpg
dl children 86fe0235-f06d-4060-8f0c-f9938604db7b Friends-1.jpg
dl children 3f2049a3-f3b8-497d-986f-4a4d1e5c23b7 Friends-6.jpg
dl children 8f789676-92b1-475d-b091-34c0a173546f HS-65.jpg
dl children fbe59277-f2f2-4ad3-a0a8-08bca1d076ad HS-70.jpg
dl children 6819ed89-7484-4dc8-ab2a-b78dc3eb2311 JennaFriends-373.jpg
dl children 595dc80c-1ed4-481a-a8fe-756a61957ab8 JennaFriends-382.jpg
dl children 4405dade-feec-4f27-aa0d-b3d1fec24b9f AndreiBW-1.jpg
dl children 90e78037-6616-4694-8ba8-b52f807c5e7f AndreiBW-19.jpg
dl children 0eee00b6-5cdd-471c-9b2b-ac1a96258bf0 AndreiBW-13.jpg
dl children 1d3eeda5-fbb6-437e-9b32-f45b3a7dec6b IMG_8815_2.jpg
dl children 148f84fd-c5a0-4872-b992-8afa6e8ce4a8 IMG_3839.CR2.jpg
dl children 26ea663d-04e0-433f-a53e-0d1d4c076245 _MG_0656.jpg
dl children ecacbbea-4005-47b0-b294-e706e4ab12e4 IMG_3705.jpg

# ── Personal Projects – Flowers ───────────────────────────────────────────────
dl personal-projects 4417525b-8de8-4097-bc89-7e8e9d44dad7 BubbleLily-1.jpg
dl personal-projects cdc62a65-9bf3-4d55-af47-dff6cdd85276 lacrimosa2fildered-1.jpg
dl personal-projects 289937b7-c546-4884-9183-0138b0b4355a Hellebore-1.jpg
dl personal-projects 7334c837-e481-4985-89f6-18d0fbda0b41 Peoni-1.jpg
dl personal-projects 4d640a66-4671-4d67-8fb3-2cd98785a011 3crocus1.jpg
dl personal-projects f8f1b33b-a862-4feb-b11a-c70fdd9a1ec6 "Queen+Anne%27s+Lace-1.jpg"
dl personal-projects e3a56a2b-d948-48b5-88d1-d9dfc465d7cf "Pink+Magnolia-1.jpg"
dl personal-projects c892d79b-287d-4b77-813c-34166cae6cd8 Lily-2.jpg
dl personal-projects eab744eb-73e3-4230-9737-c001b27486e5 Hellebore-5.jpg
dl personal-projects 62cc3288-fc91-4cd3-b58c-e4c9b694684b hibiscus-1.jpg

# ── Personal Projects – Roads ─────────────────────────────────────────────────
dl personal-projects 39c590c6-47c8-44b4-941c-b864b1517513 None-1.jpg
dl personal-projects 9a5ee5c2-41dd-4a16-917c-e8b45ec69ac5 GirlRoad-1.jpg
dl personal-projects 9fa605fa-5ba4-4f0a-8dde-f31c4f21ab01 MashaOffRoad-1.jpg
dl personal-projects 1f098f79-2ef8-4914-8db2-817b04f1cfbf Shadow-1.jpg
dl personal-projects 3aaad961-1783-4f88-92cc-bd8a05f78866 BoyRoad-1.jpg
dl personal-projects e406f006-7735-4373-9822-90e712806f20 Lidia-2.jpeg
dl personal-projects fa00e6a5-303a-4bc8-9574-fa6e44efb96b WomanRoad.jpg
dl personal-projects fdff5320-e6a2-4af0-b016-cad5473883bc Lidia-1.jpg
dl personal-projects f3e6e04d-8ff0-4afa-86f3-5a2fdc4b8116 BoyRoad-2.jpg
dl personal-projects f60fee17-5232-4990-aa4a-1c8e97ee0c0b GirlRoad-3.jpg
dl personal-projects 585a5a75-376f-456f-a1d2-8cdaee196fd2 6.png
dl personal-projects f94a04df-fc6c-4717-b3a1-b8bd18afa9e1 7.png

# ── Personal Projects – Street ────────────────────────────────────────────────
dl personal-projects 16161558-cbf4-4c78-a281-731c13c68434 Paris3-11.jpg
dl personal-projects ae3a9132-d3bd-4740-b3d6-8d7b3eb8d59f IMG_7380.JPG
dl personal-projects 67284a59-7b18-4914-9a05-fa0fd8642d2c IMG_8581.jpg
dl personal-projects 1cf40efa-8e9d-4447-9211-97f307de3cf2 IMG_6702.JPG
dl personal-projects 077c9c42-90a4-4f90-982f-d13772985814 IMG_6769.JPG
dl personal-projects 95108029-ec2e-4588-b064-29173bfeff8f IMG_6846.JPG
dl personal-projects 0df5ac71-82e4-4d83-be8d-b7b554029db1 IMG_9734.jpg
dl personal-projects 4b032919-fa0b-4555-966c-4cb382df2715 IMG_3586.jpg
dl personal-projects eb7d9da2-b232-4837-a339-75d54e46538f IMG_6254.jpg
dl personal-projects 1c16d962-3ea8-415b-9008-ccdfa9c478a3 _MG_1254.jpg
dl personal-projects c416af43-d4c3-4e04-9a6d-b900194220e6 IMG_5769.jpg
dl personal-projects 0b032663-4318-4643-ab57-d27c2f04bc9b A45B8E13-ED08-446B-9128-BF45554ACDB9.jpg
dl personal-projects b528fd4a-1104-42c0-a0c9-05bf113b284c IMG_2224.JPG
dl personal-projects cb9be1eb-5961-4780-b4fd-27df068d0363 IMG_2336.JPG
dl personal-projects 48ff0659-e50f-4f61-adb7-01b5ac045be1 IMG_5956.jpg
dl personal-projects dbab945a-46ca-4f50-91e0-3d49f45a9507 IMG_5171.jpg
dl personal-projects d4e24f7d-cc7c-40a6-a171-e1f5d483ed5c "SFO+(12).jpg"
dl personal-projects 1d665abf-9dc6-4706-82eb-286c4ec5b7a9 IMG_6975.JPG
dl personal-projects e279e405-bd32-4e85-a7d0-57591c8004b8 IMG_6957.JPG
dl personal-projects 7e437d05-82b2-4722-a07d-8ecce909ccc2 IMG_6520.jpg
dl personal-projects 6af1e770-cfa1-4f23-b851-c3aefe6f99de IMG_6450.jpg
dl personal-projects a3acaadd-ce7f-4b1e-9a56-356416d8f7bd _MG_9238.jpg

echo "Done."
