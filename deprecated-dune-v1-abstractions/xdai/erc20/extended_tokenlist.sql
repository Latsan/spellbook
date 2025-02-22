CREATE TABLE IF NOT EXISTS erc20.extended_tokenlist
(
    contract_address bytea PRIMARY KEY,
    symbol           text,
    decimals         numeric
);

BEGIN;
DELETE
FROM erc20.extended_tokenlist *;

WITH token_extention
         AS (
        SELECT symbol, decimals, contract_address
        FROM erc20.tokens
-- To fetch and format token data, use this repo: https://github.com/gnosis/gp-v2-dune
-- with the list generated by our "Missing Tokens" Query: https://dune.xyz/queries/432914
        UNION
        SELECT *
        FROM (VALUES ('xDAI', 18, decode('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'hex')),
                     ('BAO.cx', 18, decode('e0d0b1dbbcf3dd5cac67edaf9243863fd70745da', 'hex')),
                     ('sUSD', 18, decode('b1950fb2c9c0cbc8553578c67db52aa110a93393', 'hex')),
                     ('BTCCB', 18, decode('b2ae7983a8142401d45546aab981e5fbff520991', 'hex')),
                     ('MET', 18, decode('b4b6f80d8e573e9867c90163bfdb00e29d92716a', 'hex')),
                     ('TUSD', 18, decode('b714654e905edad1ca1940b7790a8239ece5a9ff', 'hex')),
                     ('USDT', 18, decode('c90132d5d1b87730da162ec9cd34885828769cc3', 'hex')),
                     ('CLNY', 18, decode('c9b6218affe8aba68a13899cbf7cf7f14ddd304c', 'hex')),
                     ('JRT', 18, decode('ccf1279c3406ad1181bee00dab4b28b23d17ddb1', 'hex')),
                     ('BAND', 18, decode('e154a435408211ac89757b76c4fbe4dc9ed2ef27', 'hex')),
                     ('ETHIX', 18, decode('ec3f3e6d7907acda3a7431abd230196cda3fbb19', 'hex')),
                     ('COSMO', 18, decode('efb06b5fcf1b9c8704f41fe96b29a428d8624ed2', 'hex')),
                     ('MPS', 0, decode('fa57aa7beed63d03aaf85ffd1753f5f6242588fb', 'hex')),
                     ('DHV', 18, decode('fbdd194376de19a88118e84e279b977f165d01b8', 'hex')),
                     ('TEC', 18, decode('5df8339c5e282ee48c0c7ce8a7d01a73d38b3b27', 'hex')),
                     ('DOUGH', 18, decode('6d237bb2248d3b40b1a54f3417667b2f39984fc8', 'hex')),
                     ('FTX Token', 18, decode('75886f00c1a20ec1511111fb4ec3c51de65b1fe7', 'hex')),
                     ('BDT', 18, decode('778aa03021b0cd2b798b0b506403e070125d81c9', 'hex')),
                     ('ENG', 8, decode('7a7d81657a1a66b38a6ca2565433a9873c6913b2', 'hex')),
                     ('DJ15', 9, decode('7c16c63684d86bacc52e8793b08a5a1a3cb1ba1e', 'hex')),
                     ('PHA', 18, decode('7ea8af7301b763451b7fb25f8fc2406819a7e36f', 'hex')),
                     ('SWASH', 18, decode('84e2c67cbefae6b5148fca7d02b341b12ff4b5bb', 'hex')),
                     ('COVAL', 8, decode('8b8407c6184f1f0fd1082e83d6a3b8349caced12', 'hex')),
                     ('NFTX', 18, decode('8e1a12da00bbf9db10d48bd66ff818be933964d5', 'hex')),
                     ('sETH', 18, decode('8f365b41b98fe84acb287540b4b4ab633e07edb2', 'hex')),
                     ('DCAKE', 18, decode('915b1a1bae2c345afbdc4cf50e2e67cf19943125', 'hex')),
                     ('PUNK', 18, decode('988d1be68f2c5cde2516a2287c59bd6302b7d20d', 'hex')),
                     ('ETHM', 18, decode('9bd5e0ce813d5172859b0b70ff7bb3c325cee913', 'hex')),
                     ('PROPHET', 9, decode('a9e5cd4efc86c01fae9a9fcd6e8669b97c92a937', 'hex')),
                     ('CODSH', 18, decode('0badb21cb5450127a91bb32e757aa44e222995c9', 'hex')),
                     ('ETH', 18, decode('0c5445921c41d1d5fa412fdc08b141f20b94b83f', 'hex')),
                     ('NEXO', 18, decode('26dc03e492763068ccfe7c39b93a22442807c360', 'hex')),
                     ('WCETH', 18, decode('2bb6abcb8c4b1ce6c170d0c656f0d8bdb291d4ae', 'hex')),
                     ('LRC', 18, decode('2be73bfeec620aa9b67535a4d3827bb1e29436d1', 'hex')),
                     ('GLDB', 18, decode('30610f98b61593de963b2303aeeaee69823f561f', 'hex')),
                     ('OM', 18, decode('309bc6dbcbfb9c84d26fdf65e8924367efccbdb9', 'hex')),
                     ('SOCKS', 18, decode('35f346cb4149746272974a92d719fd48ae2f72fa', 'hex')),
                     ('PNK', 18, decode('37b60f4e9a31a64ccc0024dce7d0fd07eaa0f7b3', 'hex')),
                     ('xMARK', 9, decode('3e33cf23073fd8d5ad1d48d1860a96c0d8e56193', 'hex')),
                     ('xREAP', 18, decode('42c6b3ac30ae82d754498f56d9372f0070349409', 'hex')),
                     ('API3', 18, decode('44b6bba599f100006143e82a60462d71ac1331da', 'hex')),
                     ('GIV', 18, decode('4f4f9b8d5b4d0dc10506e5551b0513b61fd59e75', 'hex')),
                     ('SWPR', 18, decode('532801ed6f82fffd2dab70a19fc2d7b2772c4f4b', 'hex')),
                     ('XOR', 18, decode('5bbfbfb123b72a255504be985bd2b474e481e866', 'hex')),
                     ('PRTCLE', 18, decode('b5d592f85ab2d955c25720ebe6ff8d4d1e1be300', 'hex')),
                     ('YFI', 18, decode('bf65bfcb5da067446cee6a706ba3fe2fb1a9fdfd', 'hex')),
                     ('AMIS', 9, decode('d51e1ddd116fff9a71c1b8feeb58113afa2b4d93', 'hex')),
                     ('xdbx', 18, decode('daadd8d96d01e47ee5e4eafecf14cbe46909f335', 'hex')),
                     ('COLD', 18, decode('dbcade285846131a5e7384685eaddbdfd9625557', 'hex')),
                     ('FSW', 18, decode('de1e70ed71936e4c249a7d43e550f0b99fccddfc', 'hex')),
                     ('AAVE', 18, decode('df613af6b44a31299e48131e9347f034347e2f00', 'hex')),
                     ('XRT', 9, decode('f54b47b00b6916974c73b81b7d9929a4f443db49', 'hex')),
                     ('TRADE', 18, decode('860182180e146300df38aab8d328c6e80bec9547', 'hex')),
--                     ('CRC-b2', 18, decode('b2eb4956610c3af22dd4ab064c2a8b2a0a7ce081', 'hex')),
--                     ('CRC-b8', 18, decode('b8d2f3ecb887c3d61add80f23a023360dc6ebe9e', 'hex')),
                     ('xMOON', 18, decode('1e16aa4df73d29c029d94ceda3e3114ec191e25a', 'hex')),
                     ('DAI', 18, decode('44fa8e6f47987339850636f88629646662444217', 'hex')),
                     ('MKR', 18, decode('5fd896d248fbfa54d26855c267859eb1b4daee72', 'hex')),
                     ('LYXe', 18, decode('79cf2029717e2e78c8927f65f079ab8da21781ee', 'hex')),
                     ('UBT', 8, decode('d3b93ff74e43ba9568e5019b38addb804fef719b', 'hex')),
--                     ('CRC-62', 18, decode('6293268785399bed001cb68a8ee04d50da9c854d', 'hex')),
                     ('BASE', 9, decode('699d001ef13b15335193bc5fad6cfc6747eee8be', 'hex')),
                     ('MANA', 18, decode('7838796b6802b18d7ef58fc8b757705d6c9d12b3', 'hex')),
                     ('SNX', 18, decode('3a00e08544d589e19a8e7d97d0294331341cdbf6', 'hex')),
                     ('ANT', 18, decode('437a044fb4693890e61d2c1c88e3718e928b8e90', 'hex')),
                     ('DONUT', 18, decode('524b969793a64a602342d89bc2789d43a016b13a', 'hex')),
                     ('CRV', 18, decode('712b3d230f3c1c19db860d80619288b1f0bdd0bd', 'hex')),
                     ('OMG', 18, decode('8395f7123ba3ffad52e7414433d825931c81c879', 'hex')),
                     ('BADGER', 18, decode('dfc20ae04ed70bd9c7d720f449eedae19f659d65', 'hex')),
                     ('xBRICK', 18, decode('2f9cebf5de3bc25e0643d0e66134e5bf5c48e191', 'hex')),
                     ('SUSHI', 18, decode('2995d1317dcd4f0ab89f4ae60f3f020a4f17c7ce', 'hex')),
                     ('GNO', 18, decode('9c58bacc331c9aa871afd802db6379a98e80cedb', 'hex')),
                     ('STAKE', 18, decode('b7d311e2eb55f2f68a9440da38e7989210b9a05e', 'hex')),
                     ('WETH', 18, decode('6a023ccd1ff6f2045c3309768ead9e68f978f6e1', 'hex')),
                     ('AUT', 18, decode('cae40062a887581a3d1661d0ac2b481c32e3e938', 'hex')),
                     ('LINK', 18, decode('e2e73a1c69ecf83f464efce6a5be353a37ca09b2', 'hex')),
                     ('XYO', 18, decode('fd4e5f45ea24ec50c4db4367380b014875caf219', 'hex')),
                     ('COIN', 18, decode('14411aeca652f5131834bf0c8ff581b5ddf3bc03', 'hex')),
                     ('NIF', 18, decode('1a186e7268f3ed5adfea6b9e0655f70059941e11', 'hex')),
                     ('BID', 18, decode('2977893f4c04bfbd6efc68d0e46598d27810d3db', 'hex')),
                     ('USDT', 6, decode('4ecaba5870353805a9f068101a40e0f32ed605c6', 'hex')),
                     ('EWTB', 18, decode('6a8cb6714b1ee5b471a7d2ec4302cb4f5ff25ec2', 'hex')),
                     ('FREE', 18, decode('a106739de31fa7a9df4a93c9bea3e1bade0924e2', 'hex')),
                     ('YLD', 18, decode('a2fec95b3d3fecb39098e81f108533e1abf22ccf', 'hex')),
                     ('HAUS', 18, decode('b0c5f3100a4d9d9532a4cfd68c55f1ae8da987eb', 'hex')),
                     ('ETHO', 18, decode('b17d999e840e0c1b157ca5ab8039bd958b5fa317', 'hex')),
                     ('xOWL', 18, decode('0905ab807f8fd040255f0cf8fa14756c1d824931', 'hex')),
                     ('CEL', 4, decode('0acd91f92fe07606ab51ea97d8521e29d110fd09', 'hex')),
                     ('REN', 18, decode('0da1a02cdf84c44021671d183d616925164e08aa', 'hex')),
                     ('UNI', 18, decode('4537e328bf7e4efa29d05caea260d7fe26af9d74', 'hex')),
                     ('TRIPS', 18, decode('479e32cdff5f216f93060700c711d1cc8e811a6b', 'hex')),
                     ('renBTC', 8, decode('4a88248baa5b39bb4a9caa697fb7f8ae0c3f0ddb', 'hex')),
                     ('MEME', 8, decode('512a2eb0277573ae9be0d48c782590b624048fdf', 'hex')),
                     ('HNY', 18, decode('71850b7e9ee3f13ab46d67167341e4bdc905eef9', 'hex')),
                     ('WBTC', 8, decode('8e5bbbb09ed1ebde8674cda39a0c169401db4252', 'hex')),
                     ('POA20', 18, decode('985e144eb355273c4b4d51e448b68b657f482e26', 'hex')),
                     ('LEND', 18, decode('c1b42bdb485deb24c74f58399288d7915a726c1d', 'hex')),
                     ('HEX', 8, decode('d9fa47e33d4ff7a1aca489de1865ac36c042b07a', 'hex')),
                     ('USDC', 6, decode('ddafbb505ad214d7b80b1f830fccc89b60fb7a83', 'hex')),
                     ('WXDAI', 18, decode('e91d153e0b41518a2ce8dd3d7944fa863463a97d', 'hex')),
                     ('GRT', 18, decode('fadc59d012ba3c110b08a15b7755a5cb7cbe77d7', 'hex')),
                     ('DATA', 18, decode('256eb8a51f382650b2a1e946b8811953640ee47d', 'hex')),
                     ('RICE', 18, decode('97edc0e345fbbbd8460847fcfa3bc2a13bf8641f', 'hex')),
                     ('DAI', 18, decode('2ff1d12bebce4981ee3dcb6f04057a5e4662797f', 'hex')),
                     ('XRP', 18, decode('458cbfb4daf5ee16ce14b2bc2633b1af1fe8981b', 'hex')),
                     ('AST', 4, decode('743a991365ba94bfc90ad0002cad433c7a33cb4a', 'hex')),
                     ('CVP', 18, decode('7da0bfe9d26c5b64c7580c04bb1425364273e4b0', 'hex')),
                     ('BRIGHT', 18, decode('83ff60e2f93f8edd0637ef669c69d5fb4f64ca8e', 'hex')),
                     ('AMPL', 9, decode('c84dd5b971521b6c9fa5e10d25e6428b19710e05', 'hex')),
                     ('DPI', 18, decode('d3d47d5578e55c880505dc40648f7f9307c3e7a8', 'hex')),
                     ('PANTS', 18, decode('0dae13fae64180d3cadcad22329a4abcaef15ca6', 'hex')),
                     ('RAID', 18, decode('18e9262e68cc6c6004db93105cc7c001bb103e49', 'hex')),
                     ('FOX', 18, decode('21a42669643f45bc0e086b8fc2ed70c23d67509d', 'hex')),
                     ('DXD', 18, decode('b90d6bec20993be5d72a5ab353343f7a0281f158', 'hex')),
                     ('TVK', 18, decode('eb2bcabb0cdc099978a74cfe4ab4d45e7e677a45', 'hex')),
                     ('EYE', 18, decode('0e7ea338d2aa05b5260d90d1e77afcf0d1278cc4', 'hex')),
                     ('LEVIN', 18, decode('1698cd22278ef6e7c0df45a8dea72edbea9e42aa', 'hex')),
                     ('CMP', 18, decode('911f196ed489e41c8b45b5c56fece021c27a6159', 'hex')),
                     ('COMP', 18, decode('df6ff92bfdc1e8be45177dc1f4845d391d3ad8fd', 'hex')),
                     ('MESH', 18, decode('e7ef58d8180cc269c6620ded3e6cc536a52e2ebd', 'hex')),
                     ('BFED', 8, decode('f2197c8b553e37e949815360d5ca5e745e925511', 'hex')),
                     ('TRIB', 18, decode('ff0ce179a303f26017019acf78b951cb743b8d9b', 'hex')),
                     ('BAL', 18, decode('7ef541e2a22058048904fe5744f9c7e4c57af717', 'hex')),
                     ('TOW', 18, decode('a86e85c9bf599f744866dadac129ea478d14923f', 'hex')),
                     ('BOND', 18, decode('b31a2595e4cf66efbc1fe348b1429e5730891382', 'hex')),
                     ('MDZA', 18, decode('bab3cbdcbcc578445480a79ed80269c50bb5b718', 'hex')),
                     ('CRC-bc', 18, decode('bc24fde08bb61e59c466a737908a40e8993add03', 'hex')),
                     ('BAT', 18, decode('c6cc63f4aa25bbd4453eb5f3a0dfe546fef9b2f3', 'hex')),
                     ('MRP', 18, decode('cc043d8820a6dc3e74ef6fb4772fae00c1563489', 'hex')),
                     ('RARE', 18, decode('cf740ac463098e442b31a5e88f4b359b30255616', 'hex')),
                     ('BUSDC', 18, decode('d10cc63531a514bba7789682e487add1f15a51e2', 'hex')),
                     ('CRC-d5', 18, decode('d5084760914184d78a9e21cd7aa3da9015fd59bd', 'hex')),
                     ('BZZ', 16, decode('dbf3ea6f5bee45c02255b2c26a16f300502f68da', 'hex')),
                     ('BUSD', 18, decode('dd96b45877d0e8361a4ddb732da741e97f3191ff', 'hex')),
                     ('RARI', 18, decode('4be85acc1cd711f403dc7bde9e6cadfc5a94744b', 'hex')),
                     ('ALVIN', 18, decode('50dbde932a94b0c23d27cdd30fbc6b987610c831', 'hex')),
                     ('CRC-55', 18, decode('55b702c10044ce03f712eb7a07c70bfb5c338649', 'hex')),
                     ('RARE', 18, decode('57e93bb58268de818b42e3795c97bad58afcd3fe', 'hex')),
                     ('RSR', 18, decode('5a87eac5642bfed4e354ee8738dacd298e07d1af', 'hex')),
                     ('CFXQ', 6, decode('64b17a95e6c45306fb23bc526eb2dc9e1331a1b1', 'hex')),
                     ('RXDAI', 18, decode('6b0f8a3fb7cb257ad7c72ada469ba1d3c19c5094', 'hex')),
                     ('POLS', 18, decode('75481a953a4bba6b3c445907db403e4b5d222174', 'hex')),
                     ('PERP', 18, decode('7ecf26cd9a36990b8ea477853663092333f59979', 'hex')),
                     ('BAO', 18, decode('82dfe19164729949fd66da1a37bc70dd6c4746ce', 'hex')),
                     ('AUDIO', 18, decode('8a95ea379e1fa4c749dd0a7a21377162028c479e', 'hex')),
                     ('0xMR', 18, decode('8c88ea1fd60462ef7004b9e288afcb4680a3c50c', 'hex')),
                     ('ROBOT', 18, decode('8d02b73904856de6998ffdf6e7ee18cc21137a79', 'hex')),
                     ('DUCK', 18, decode('8e7ab03ca7d17996b097d5866bfaa1e251c35c6a', 'hex')),
                     ('AAH', 18, decode('99deb53501ac9b1c9f386f628f284b5cd8b107b9', 'hex')),
                     ('BNT', 18, decode('9a495a281d959192343b0e007284bf130bd05f86', 'hex')),
                     ('AXS', 18, decode('bde011911128f6bd4abb1d18f39fdc3614ca2cfe', 'hex')),
                     ('SYMM', 18, decode('c45b3c1c24d5f54e7a2cf288ac668c74dd507a84', 'hex')),
                     ('NODE', 18, decode('c60e38c6352875c051b481cbe79dd0383adb7817', 'hex')),
                     ('DAI', 18, decode('fc8b2690f66b46fec8b3ceeb95ff4ac35a0054bc', 'hex')),
                     ('ZRX', 18, decode('226bcf0e417428a25012d0fa2183d37f92bcedf6', 'hex')),
                     ('yDAI+yUSDC+yUSDT+yTUSD', 18, decode('22bd2a732b39dace37ae7e8f50a186f3d9702e87', 'hex')),
                     ('FR', 18, decode('270de58f54649608d316faa795a9941b355a2bd0', 'hex')),
                     ('FRACTION', 18, decode('2bf2ba13735160624a0feae98f6ac8f70885ea61', 'hex')),
                     ('RPL', 18, decode('2f0e755efe6b58238a67db420ff3513ec1fb31ef', 'hex')),
                     ('HOT', 18, decode('346b2968508d32f0192cd7a60ef3d9c39a3cf549', 'hex')),
                     ('xCOMB', 18, decode('38fb649ad3d6ba1113be5f57b927053e97fc5bf7', 'hex')),
                     ('AC', 18, decode('5f1f81de1d21b97a5d0d5d62d89bde9ddec27325', 'hex')),
                     ('HIVESHARE', 18, decode('97e4ebc14c117c1ac2d032a5a8140c84628b0d17', 'hex')),
                     ('XGT', 18, decode('c25af3123d2420054c8fcd144c21113aa2853f39', 'hex')),
                     ('AKRO', 18, decode('d27e1ecc4748f42e052331bea917d89beb883fc3', 'hex')),
                     ('DATA', 18, decode('e4a2620ede1058d61bee5f45f6414314fdf10548', 'hex')),
                     ('GEN', 18, decode('12dabe79cffc1fde82fcd3b96dbe09fa4d8cd599', 'hex')),
                     ('RING', 18, decode('1479ebfe327b62bff255c0749a242748d3e7347a', 'hex')),
                     ('KNC', 18, decode('1534fb3e82849314360c267fe20df3901a2ed3f9', 'hex')),
                     ('TESTA', 18, decode('16afe6e6754fa3694afd0ce48f4bea102efacc17', 'hex')),
                     ('CREAM', 18, decode('1939d3431cf0e44b1d63b86e2ce489e5a341b1bf', 'hex')),
                     ('CRC-1b', 18, decode('1b86ad8974662af64e663a4cd799310c249889a7', 'hex')),
                     ('ZRX', 18, decode('226bcf0e417428a25012d0fa2183d37f92bcedf6', 'hex')),
                     ('FR', 18, decode('270de58f54649608d316faa795a9941b355a2bd0', 'hex')),
                     ('FRACTION', 18, decode('2bf2ba13735160624a0feae98f6ac8f70885ea61', 'hex')),
                     ('HOT', 18, decode('346b2968508d32f0192cd7a60ef3d9c39a3cf549', 'hex')),
                     ('OCEAN', 18, decode('51732a6fc4673d1acca4c047f5465922716508ad', 'hex')),
                     ('CRC-68', 18, decode('685b01e3cf8107c8e4dd3043e6098f4f050b3949', 'hex')),
                     ('CRC-9a', 18, decode('9ae18af73c10daa6c5159299ccef0b943bd0b5aa', 'hex')),
                     ('CRC-a8', 18, decode('a8edb428d303b02fb9b6ff35137a3fa040b873e6', 'hex')),
                     ('LTI', 18, decode('cf9dc2de2a67d7db1a7171e3b8456d2171e4da75', 'hex')),
                     ('UNCX', 18, decode('0116e28b43a358162b96f70b4de14c98a4465f25', 'hex')),
                     ('TBTC', 18, decode('0811e451447d5819976a95a02f130c3b00d59346', 'hex')),
                     ('PLR', 18, decode('10beea85519a704a63765d396415f9ea5aa30a17', 'hex')),
                     ('SHWEATPANTS', 18, decode('11c9f4c3e960cce4464e25a9fa5414ab72fc45ea', 'hex')),
                     ('SNAFU', 18, decode('27b9c2bd4baea18abdf49169054c1c1c12af9862', 'hex')),
                     ('AGVE', 18, decode('3a97704a1b25f08aa230ae53b352e2e72ef52843', 'hex')),
                     ('JPYC', 18, decode('417602f4fbdd471a431ae29fb5fe0a681964c11b', 'hex')),
                     ('DIP', 18, decode('48b1b0d077b4919b65b4e4114806dd803901e1d9', 'hex')),
                     ('ENJ', 18, decode('5a757f0bcadfdb78651b7bdbe67e44e8fd7f7f6b', 'hex')),
                     ('JOON', 4, decode('5fe9885226677f3eb5c9ad8ab6c421b4ea38535d', 'hex')),
                     ('MIVA', 18, decode('63e62989d9eb2d37dfdb1f93a22f063635b07d51', 'hex')),
                     ('UNCL', 18, decode('703120f2f2011a0d03a03a531ac0e84e81f15989', 'hex')),
                     ('MATIC', 18, decode('7122d7661c4564b7c6cd4878b06766489a6028a2', 'hex')),
                     ('WCHI', 8, decode('7211ab649a4139561a152b787de52d257cbaaee9', 'hex')),
                     ('CHSB', 8, decode('76eafffa1873a8acd43864b66a728bd873c5e08a', 'hex')),
                     ('1INCH', 18, decode('7f7440c5098462f833e123b44b8a03e1d9785bab', 'hex')),
                     ('PAN', 18, decode('981fb9ba94078a2275a8fc906898ea107b9462a8', 'hex')),
                     ('SURF', 18, decode('c12956b840b403b600014a3092f6ebd9259738fe', 'hex')),
                     ('MCDC', 2, decode('c577cddabb7893cc2ca15ef4b5d5e5e13c3feed3', 'hex')),
                     ('WBNB', 18, decode('ca8d20f3e0144a72c6b5d576e9bd3fd8557e2b04', 'hex')),
                     ('HOPR', 18, decode('d057604a14982fe8d88c5fc25aac3267ea142a08', 'hex')),
                     ('CHEEMS', 18, decode('eaf7b3376173df8bc0c22ad6126943cc8353c1ee', 'hex')),
                     ('TRAC', 18, decode('eddd81e0792e764501aae206eb432399a0268db5', 'hex')),
                     ('XGT', 18, decode('f1738912ae7439475712520797583ac784ea9033', 'hex')),
                     ('ALBC', 18, decode('fb23cfd35046466fdba7f73dc2fccb5b17abf1aa', 'hex')),
                     ('ROOK', 18, decode('03959ac65e621e8c95d5e0f75ea96e5c03a15009', 'hex')),
                     ('VITA', 18, decode('0939a7c3f8d37c1ce67fada4963ae7e0bd112ff3', 'hex')),
                     ('HND', 18, decode('10010078a54396f62c96df8532dc2b4847d47ed3', 'hex')),
                     ('COW', 18, decode('177127622c4a00f3d409b75571e12cb3c8973d3c', 'hex')),
                     ('HUSD', 8, decode('1e37e5b504f7773460d6eb0e24d2e7c223b66ec7', 'hex')),
                     ('MAI', 18, decode('3f56e0c36d275367b8c502090edf38289b3dea0d', 'hex')),
                     ('MR', 18, decode('481d6104761442f162d1f7ac3dc6f98896e7a4ef', 'hex')),
                     ('GTON', 18, decode('6ab6d61428fde76768d7b45d8bfeec19c6ef91a8', 'hex')),
                     ('GHO', 18, decode('9913ed5c459a5f67e22366df5bbf00cd33154214', 'hex')),
                     ('AGF', 18, decode('99c9df4bae3ae5630a146cae3fdec791ab0440c6', 'hex')),
                     ('sGNO', 18, decode('a4ef9da5ba71cc0d2e5e877a910a37ec43420445', 'hex')),
                     ('FLX', 18, decode('d87eaa26dcfb0c0a6160ccf8c8a01beb1c15fb00', 'hex')),
                     ('ET', 18, decode('0306c155ebF70Cd9F92841b07278C2bd1920E792', 'hex')),
                     ('NMR', 18, decode('0b7A1c1A3D314DCC271EA576dA400B24e9ad3094', 'hex')),
                     ('x3CRV', 18, decode('1337BedC9D22ecbe766dF105c9623922A27963EC', 'hex')),
                     ('WagTest4WXDAI', 18, decode('1901403C3703A3493aCf5351c4c9b2a12b091b54', 'hex')),
                     ('yvUSDC', 6, decode('21d7B09Bcf08F7b6b872BED56cB32416AE70bCC8', 'hex')),
                     ('WagTest4USDC', 6, decode('234Ef54386B6F72eC2a55206E2177D38a2873aB0', 'hex')),
                     ('WagTestUSDC', 18, decode('23a68703288520592BA4D5B3C65319E8498A2A33', 'hex')),
                     ('BLESS', 18, decode('268b00641ae3BB8D274f4725CfAFD3a7c031644F', 'hex')),
                     ('WagTest9USDC', 6, decode('2e42B0A16971B776f8c635988428eB2085C5B77f', 'hex')),
                     ('WagTest6USDC', 6, decode('2E81B4dC4d6aa27fd9C153f1b12984a5D2a098e4', 'hex')),
                     ('BEN', 18, decode('33198acCA4b0EB6d9134eC8639c1C142102A07b7', 'hex')),
                     ('TERC', 18, decode('35dAAC2321A8C32F4f266C9166ac05F394E67630', 'hex')),
                     ('WagTest3WXDAI', 18, decode('3a3770145B07DF1Bcd887825FE8b87C4a7c74108', 'hex')),
                     ('mCOPPER', 18, decode('3Bcfa75017adf6D4EEB22bc0549Af388A9dF5e13', 'hex')),
                     ('RGT', 18, decode('417Ae38B3053A736B4274aed8DBD1a8A6FDbc974', 'hex')),
                     ('WATER', 18, decode('4291F029B9e7acb02D49428458cf6fceAC545f81', 'hex')),
                     ('blaTEST', 18, decode('46C4758Bfe10552F6A3E34BA0A1c319807D8a7f0', 'hex')),
                     ('OKB', 18, decode('4eFDfbb7Cca540a79A7e4dCaD1cb6ED14f21c43e', 'hex')),
                     ('WagTest3USDC', 6, decode('5614c8A88f6513A20A1bC230F63fEAd391123120', 'hex')),
                     ('KP3R', 18, decode('5B449Ea0e550C143074146abc89A6328D9E70798', 'hex')),
                     ('WagTestWXdai', 18, decode('600b1538cC4966427fbC5548Bd580214643aeB75', 'hex')),
                     ('rGNO', 18, decode('6aC78efae880282396a335CA2F79863A1e6831D4', 'hex')),
                     ('OPT', 18, decode('74300F63CeD59a3e6D25C5296555a550825a8d78', 'hex')),
                     ('ECRC', 18, decode('939b2731997922F21ab0A0bAB500a949C0FC3550', 'hex')),
                     ('WagTest6WXDAI', 18, decode('97BbaDf33804Bb9065091eb455B969D1c42B6a60', 'hex')),
                     ('MPH', 18, decode('A088D78e9c9CBccAD3a0153341385633B1B1125d', 'hex')),
                     ('mFOOD', 18, decode('AC01aC9Ef03DEfe3a28144FAF0f4BD6b10c92e70', 'hex')),
                     ('MATH', 18, decode('Af4D17A2077e1dE12DE66a44DE1B4f14C120d32D', 'hex')),
                     ('mTOOL', 18, decode('b0909e254b172Ab304ba93B87d9082eC90e25302', 'hex')),
                     ('ESR', 18, decode('D3226B12e6188133b19Ac0419f34B0ed5B10f069', 'hex')),
                     ('mWOOD', 18, decode('D8cc0DF22689033aB24458bD416daD005Ba94255', 'hex')),
                     ('QI', 18, decode('dFA46478F9e5EA86d57387849598dbFB2e964b02', 'hex')),
                     ('HOGE', 9, decode('DfF7fcF6a86F7Dc86E7facECA502851f82a349A6', 'hex')),
                     ('vTERC', 18, decode('e4Cb7cfD027C024AcA339026b1E70ff68f82305B', 'hex')),
                     ('WagTest9WXDAI', 18, decode('F9A797B40Dbc6c92aAa69AbA169b1e68a5722037', 'hex')),
                     ('yvCurve-3pool', 18, decode('Ffe9fa48A805AC26eEF9DC750765C4dFB530f70b', 'hex'))
             ) as unlisted (symbol, decimals, contract_address)
    )

INSERT
INTO erc20.extended_tokenlist (symbol, decimals, contract_address)
SELECT symbol, decimals, contract_address
FROM token_extention;

COMMIT;
