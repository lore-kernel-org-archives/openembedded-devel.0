Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0115.outbound.protection.outlook.com [157.56.112.115])
	by mail.openembedded.org (Postfix) with ESMTP id E2CD773E11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 07:20:10 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from [10.9.5.47] (91.217.248.11) by
	DB5PR02MB1176.eurprd02.prod.outlook.com (10.162.163.22) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 07:20:08 +0000
Message-ID: <55DC1737.1070201@theqtcompany.com>
Date: Tue, 25 Aug 2015 10:20:23 +0300
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>	<37e08b9cbf4bc8c2194e2274c1ada3f5ead965fa.1440407387.git.samuli.piippo@theqtcompany.com>
	<20150824124512.GE2446@jama>
In-Reply-To: <20150824124512.GE2446@jama>
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR07CA0032.eurprd07.prod.outlook.com (10.141.45.160) To
	DB5PR02MB1176.eurprd02.prod.outlook.com (25.162.163.22)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1176;
	2:OwEfv/wW2bS3mUUtVl1Yr+ncU0CPqjFl1ZuRiNWCnnPJY10Rl6bIiq/b+qCGuRvJfzd6zgT0sYMrURv1mxqI4d0rym42/Wo/q/nfQ69sMw2FjK/qBIUptwoEQDxq327UfTSm5rjh0OzNofvXguv9tNtUuJNN/sMEfJUP5hMabGo=;
	3:4yvQg9jX4fBnWeXafZEmffG62DPqU3I37Cme0ZJC6sClAGvz34U72P9SB6kn+Qtg1V/gwy6gp1DN225NeIzgxH2KTw4bG1ZgYEPO4FUdbuCsRLov2Ipj8EOui9P5uIW+nQbl9RGZzfOJUxQQ+vCHrQ==;
	25:93paeKIxGX82E4JqdNrtlfjcqC/EyfqaI2UKrg5YeGTdeubFMaxCRFpyjp4l+hyKo/Ai5VeLK2dpjXEhqEjPMADU27HKrQaKfmUhNeY75/n7grkDgJovtxZgZDMZHKsCYVtpJOWRqOQQ+wThYwW3jxGciE4G1QfOCZiv/NXMFYELvfU2/fDoKfth58H3edCnbHhPi9gQmicEBZVR04JassnDbOUsHpKt20z6U5J37R5C9AiUkocoNo2GgjqvJ40JLbMbaYPEQzV4KAy1q3T6YA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1176;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1176;
	20:OtUdSzq7l49gAX6p90R3E4TV/XBQHzMOKbDmOYLLEdBYfv8F/80fDRdW3iG140KbTbIMlZ7PEVCO69A1KkTEPEom3NdnIRezSBb2I2LKuHcLJtvNUJPy2Yg4g3m7LMlRVYpo3dkjbvb0UEC6LFXmMu8D2Z6iFuRHiCZf5+qot6/ySjHJcnJgsF0/qvor25wn2VTTc8qNUdNoCjNcPoi+6gdDFx5bkTbEIYcvFDC9cRxUweoYpweFIS3umaueKOjhwPNVjEbmPBlmG2l6LVoi0kgV7kvrjuAdDTWTKJlp8S8b4e58Qu4w/Xg1DhAyAAN4J9YQdCjTZxGRDL76/R69DliAOPeMVwgZqvQwUnD492yBvlonojJVYipgmkX0Uhr4IoEm3SicliS5D+GO0t+1T4vQS9t3pDKA3UYpPP+oM5nIx3+AYlOjZtCj2xGY6UR2MJ42cvAec6T3v5k5HbVF3hfMUS6zY4u7TqS0iBZSGusYEzJEt6i3Y5/g0Pij/gpk;
	4:k9PTF8i5pmeln8CIsgjiWJ8MMEqqN6/dVSOkf+cPRkdIztI635SH+TN8UrSIaINBHSXdQBZ/6oaC231VSaidl6oPlevOzfjV9tD1+FBPodtp9iPyyaAv2OjrCRlDuqh5kG97Ir6Qn/3aC+vem9tjlZ5DIMTVTbsAApSkCGprsONewDHFc2h4306EgnFnGDFFWKwCAr9LFXTHxXwadZNnmZkTjIbYPGHBfRGaNcmd7c8q2sIHWy96aDnCXfo53I9e3NyjQn1j2f/i4BvZz8RQ37Y9yc2Q8B0J0iGLoTtql0rh21SjB/wRjKP0Bis8oc3J
X-Microsoft-Antispam-PRVS: <DB5PR02MB11763EE0608A6279286B47F290610@DB5PR02MB1176.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1176; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1176; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(189002)(24454002)(199003)(5007970100001)(46102003)(54356999)(65816999)(1720100001)(68736005)(101416001)(76176999)(77096005)(15975445007)(105586002)(50986999)(87266999)(2351001)(33656002)(5004730100002)(65806001)(66066001)(65956001)(50466002)(64126003)(92566002)(106356001)(23746002)(42186005)(2950100001)(575784001)(62966003)(4001540100001)(77156002)(40100003)(19580395003)(450100001)(5001830100001)(64706001)(83506001)(86362001)(59896002)(5001860100001)(36756003)(81156007)(97736004)(47776003)(189998001)(4001350100001)(122386002)(87976001)(5001960100002)(5001920100001)(19580405001)(80316001)(107886002)(110136002)(7099028)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1176; H:[10.9.5.47];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DB5PR02MB1176;
	23:x3PquUdnBJEhYV/jyLeYMlhPkuyfOkbL4ga3R?=
	=?Windows-1252?Q?Wa76buBicivMV6EnFGjwl7CV0z9JLJLlOFqmOt8rJuIC7kXq71LAZOaH?=
	=?Windows-1252?Q?ktefEhHjazwmOKRMfWzF0SI+b8K5wqpNVYrE7xR78ba8F/2zDa76H6RN?=
	=?Windows-1252?Q?Lvxb2vgFAzXfTcPHAQLHGHSYYkBrXY27KLOfIqeRPsslryfphYVJ2APg?=
	=?Windows-1252?Q?ZCnDAQL39cHFwEl4XgSA6Mj0HxPJ+lZANZllOQCdm+NLdzwv3SV2+NKx?=
	=?Windows-1252?Q?s7Li9sfZepr/2OkxulnLbdKdKtJkvAecW3DtvJqWzuXGaSEg5haXCxAz?=
	=?Windows-1252?Q?pVYgbyNZiIVdtzgbMTN2W3mpIqYO9Qg2xhkuVRh8rOLLCotVzeK2VvcU?=
	=?Windows-1252?Q?flYPAg7rkNKRMNsf+EwD9mjI9oLFP+YFmmg44r/wnUNdFLQHd8PG/9lk?=
	=?Windows-1252?Q?QXd/Yz0TZ+JVkmQjwHq34IZz5iGnlyzBtRL+Pvj3ikczFoKGwUv+wK0K?=
	=?Windows-1252?Q?lOt61FSbn23avVBDEOygYdLFtzdnCfTVI2zfNgITs3GM6U1culoKU9FD?=
	=?Windows-1252?Q?gEd/GR64q8HyJRpPJQgffqk43dxoT1hjr9fn4123SwDkwjp5lYPkyDuf?=
	=?Windows-1252?Q?e1PtXXTSdHTqHMKCz4l6II+91baPCGc7bLPrWrIqYhvCexgc4zOkUNsl?=
	=?Windows-1252?Q?jO9YB1nwoEkH5+xmL0deJ6Ek4zn8tDTXvvVlt/yyxNTQVVDHAktjY1gY?=
	=?Windows-1252?Q?iFXIghC0NqSbIaLDb45qxevVMzYskgpCUIbwHma2i/REKa7tBl7goV6O?=
	=?Windows-1252?Q?xBvypSq7bCvaGBfa9tQQQkcYK+NmPkTlNo9/HtqK5E8pXDmjZqZXyEFN?=
	=?Windows-1252?Q?j63byvAWdYvAXjlmJnvGdhA9rlY78Vmh0KayebafxXVxZXzMBsjcr620?=
	=?Windows-1252?Q?UEWUnhznIbB5PSK37XKszmkzDmItxgwtdiB+DsF3olbIWoQfMQVUcfIA?=
	=?Windows-1252?Q?C1NZogTQj+L7c41n/U9vnUOXuO58r69/L2CDgC/snAjflo175GZ3bs3q?=
	=?Windows-1252?Q?C9oU70gZ7tgZ8U0Z9XSbm25JTVeCi3705BpDuLIceFEpqpvlc6IfQWgp?=
	=?Windows-1252?Q?yRqQ70uD2OFfiPKMBYMNAK6aM42ryb/gRCpTb7Too9RBTwqCrPAKzDgO?=
	=?Windows-1252?Q?2pdi8AzPTBaX6vQfN5pzQK6PavDWDWNrsL2kcoB13GxODS7zrmgE3Fp0?=
	=?Windows-1252?Q?odzIVvb2ZrISw6LJ/cSYnjlDyVyWppEWObQbOyWAGMXOvQyc0a/Bq5jJ?=
	=?Windows-1252?Q?OEMPif/0ldTrZDCWQOWPp2/MkDXxbtJ3GYTnePED/HT1N2OiZYzYxTZN?=
	=?Windows-1252?Q?GGibrWXgjhmO0EaRvYCj3kpLM4jE2AzVoHhnZDWAZ3KSxc/rvEWhfT+j?=
	=?Windows-1252?Q?j8sNHPpuqZJh55FzUNlHCSa9+HCsZ/j643ZYBBczd8Ll+PPc+VW4YrnP?=
	=?Windows-1252?Q?eBXaIg62h2aaD89pRlDmkSI0kjeCXCT5qX3OIUl6pZpj24suWiGX9ao6?=
	=?Windows-1252?Q?WbFYtPFjPIzqC4u6wg7sd6U+eM7lzvUKydPCZOXDHWHf4dbQlfBGScE/?=
	=?Windows-1252?Q?Jgl4Dcq/eJUaNgifUCRjRqDB/zSpvoCgMmojpqTS7LgOILSyuv5+rr5n?=
	=?Windows-1252?Q?DDrucGN5X045n/jjNaKIUtoH7n1cmk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1176;
	5:NGaSvoKwaouDrnbkg1gWsgJXEaZzmmwt+SrfS/K16s3TuPsYrqYCMGSAn93J976hG9BkmhF20Txl28gw9vb3Z79QJdx7Rk7yv+IeOd+p8nWwKenOcMhnH80UZ86vFBQS9EZtUi9yDihRYc7SUJJxPA==;
	24:3ccHyK1IBSf4W2a7fhohHIkRwx4PMMK7Qnt3CGugMgmv/eVjzFjHpxnfqW43uxFEhysFQe0B+oRIPUS0fEbx7uxs6fVS0BwjS0XWO+A9nyw=;
	20:HAllLIkVnj2ROj3S5FyOHW1RwfnVB7A1NAPJNe6E1x29g1fg/HswZUNwuupXdW7QXGeB/HONMPDavbxvBXGGTg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 07:20:08.7960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1176
Subject: Re: [meta-qt5][PATCH 06/11] qt5: make qt5.inc reusable qt5-module.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Aug 2015 07:20:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 24.08.2015 15:45, Martin Jansa wrote:
> On Mon, Aug 24, 2015 at 12:13:52PM +0300, Samuli Piippo wrote:
>> qt5.inc has common parts that can be used to build any Qt5 module.
>> Make it a bbclass so that it is easily usable from other meta layers.
>
> require recipes-qt/qt5/qt5.inc
>
> can be used in other layers as well
>

It can, but as a bblclass it would make it clear that it's a supported 
thing to do, like qmake5 currently is.
And maybe help guide further changes so that it remains usable from 
other layers as well.

>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>> ---
>>   recipes-qt/qt5/qt5.inc => classes/qt5-module.bbclass | 0
>>   recipes-qt/examples/cinematicexperience_1.0.bb       | 2 +-
>>   recipes-qt/examples/qt5everywheredemo_1.0.bb         | 2 +-
>>   recipes-qt/examples/qt5nmapcarousedemo_1.0.bb        | 2 +-
>>   recipes-qt/examples/qt5nmapper_1.0.bb                | 2 +-
>>   recipes-qt/examples/qtsmarthome_1.0.bb               | 2 +-
>>   recipes-qt/examples/quitbattery_1.0.0.bb             | 2 +-
>>   recipes-qt/examples/quitindicators_1.0.1.bb          | 2 +-
>>   recipes-qt/libconnman-qt/libconnman-qt5_git.bb       | 2 +-
>>   recipes-qt/qt5/qt3d_git.bb                           | 2 +-
>>   recipes-qt/qt5/qtbase_git.bb                         | 2 +-
>>   recipes-qt/qt5/qtconnectivity_git.bb                 | 2 +-
>>   recipes-qt/qt5/qtdeclarative_git.bb                  | 2 +-
>>   recipes-qt/qt5/qtenginio_git.bb                      | 2 +-
>>   recipes-qt/qt5/qtgraphicaleffects_git.bb             | 2 +-
>>   recipes-qt/qt5/qtimageformats_git.bb                 | 2 +-
>>   recipes-qt/qt5/qtlocation_git.bb                     | 2 +-
>>   recipes-qt/qt5/qtmultimedia_git.bb                   | 2 +-
>>   recipes-qt/qt5/qtquick1_git.bb                       | 2 +-
>>   recipes-qt/qt5/qtquickcontrols_git.bb                | 2 +-
>>   recipes-qt/qt5/qtscript_git.bb                       | 2 +-
>>   recipes-qt/qt5/qtsensors_git.bb                      | 2 +-
>>   recipes-qt/qt5/qtserialport_git.bb                   | 2 +-
>>   recipes-qt/qt5/qtsvg_git.bb                          | 2 +-
>>   recipes-qt/qt5/qtsystems_git.bb                      | 2 +-
>>   recipes-qt/qt5/qttools_git.bb                        | 2 +-
>>   recipes-qt/qt5/qttranslations_git.bb                 | 2 +-
>>   recipes-qt/qt5/qtwayland_git.bb                      | 2 +-
>>   recipes-qt/qt5/qtwebchannel_git.bb                   | 2 +-
>>   recipes-qt/qt5/qtwebengine_git.bb                    | 2 +-
>>   recipes-qt/qt5/qtwebkit-examples_git.bb              | 2 +-
>>   recipes-qt/qt5/qtwebkit_git.bb                       | 2 +-
>>   recipes-qt/qt5/qtwebsockets_git.bb                   | 2 +-
>>   recipes-qt/qt5/qtx11extras_git.bb                    | 2 +-
>>   recipes-qt/qt5/qtxmlpatterns_git.bb                  | 2 +-
>>   35 files changed, 34 insertions(+), 34 deletions(-)
>>   rename recipes-qt/qt5/qt5.inc => classes/qt5-module.bbclass (100%)
>>
>> diff --git a/recipes-qt/qt5/qt5.inc b/classes/qt5-module.bbclass
>> similarity index 100%
>> rename from recipes-qt/qt5/qt5.inc
>> rename to classes/qt5-module.bbclass
>> diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/examples/cinematicexperience_1.0.bb
>> index 116127f..b1eee73 100644
>> --- a/recipes-qt/examples/cinematicexperience_1.0.bb
>> +++ b/recipes-qt/examples/cinematicexperience_1.0.bb
>> @@ -21,7 +21,7 @@ S = "${WORKDIR}/Qt5_CinematicExperience_rpi_${PV}/"
>>   DEPENDS = "qtdeclarative qtgraphicaleffects"
>>   RDEPENDS_${PN} = "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugins"
>>
>> -require recipes-qt/qt5/qt5.inc
>> +inherit qt5-module
>>
>>   do_install() {
>>       install -d ${D}${datadir}/${P}
>> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> index 0546b00..b906741 100644
>> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> @@ -11,7 +11,7 @@ SRC_URI = "${QT_GIT}/qt-labs/qt5-everywhere-demo.git"
>>
>>   S = "${WORKDIR}/git/QtDemo"
>>
>> -require recipes-qt/qt5/qt5.inc
>> +inherit qt5-module
>>
>>   do_install() {
>>       install -d ${D}${datadir}/${P}
>> diff --git a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
>> index 7edf727..67525ca 100644
>> --- a/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
>> +++ b/recipes-qt/examples/qt5nmapcarousedemo_1.0.bb
>> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "445da212074a10a432f4508d125814212bbe7a967bfa47b015b92dfac6
>>
>>   S = "${WORKDIR}/Qt5_NMap_CarouselDemo_1.0"
>>
>> -require recipes-qt/qt5/qt5.inc
>> +inherit qt5-module
>>
>>   do_install() {
>>       install -d ${D}${datadir}/${P}
>> diff --git a/recipes-qt/examples/qt5nmapper_1.0.bb b/recipes-qt/examples/qt5nmapper_1.0.bb
>> index 77cb067..cc61b18 100644
>> --- a/recipes-qt/examples/qt5nmapper_1.0.bb
>> +++ b/recipes-qt/examples/qt5nmapper_1.0.bb
>> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "607fbf4c448f00d3c563f9ef8a582bcb6e8fe550e80b56bf8d9127a417
>>
>>   S = "${WORKDIR}/Qt5_NMapper_1.0"
>>
>> -require recipes-qt/qt5/qt5.inc
>> +inherit qt5-module
>>
>>   do_install() {
>>       install -d ${D}${datadir}/${P}
>> diff --git a/recipes-qt/examples/qtsmarthome_1.0.bb b/recipes-qt/examples/qtsmarthome_1.0.bb
>> index 944c4dc..3af01f4 100644
>> --- a/recipes-qt/examples/qtsmarthome_1.0.bb
>> +++ b/recipes-qt/examples/qtsmarthome_1.0.bb
>> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "fceaa813c33e462bad6c0383eaef81a6f6e586c15d1fa73898173b517f
>>
>>   S = "${WORKDIR}/smarthome_src"
>>
>> -require recipes-qt/qt5/qt5.inc
>> +inherit qt5-module
>>
>>   do_install() {
>>       install -d ${D}${datadir}/${P}
>> diff --git a/recipes-qt/examples/quitbattery_1.0.0.bb b/recipes-qt/examples/quitbattery_1.0.0.bb
>> index ea218d7..a8fb77d 100644
>> --- a/recipes-qt/examples/quitbattery_1.0.0.bb
>> +++ b/recipes-qt/examples/quitbattery_1.0.0.bb
>> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "38dcb7630553c397f9d8a53c6411b1a6237956ed8dd4859e01487b1dd8
>>
>>   S = "${WORKDIR}/QUItBattery_1.0.0"
>>
>> -require recipes-qt/qt5/qt5.inc
>> +inherit qt5-module
>>
>>   do_install() {
>>       install -d ${D}${datadir}/${P}
>> diff --git a/recipes-qt/examples/quitindicators_1.0.1.bb b/recipes-qt/examples/quitindicators_1.0.1.bb
>> index 19a861a..0377350 100644
>> --- a/recipes-qt/examples/quitindicators_1.0.1.bb
>> +++ b/recipes-qt/examples/quitindicators_1.0.1.bb
>> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "db84112adbde9b6f28c129e8fb37a6912f4bc34bed18e57f570fb78ea0
>>
>>   S = "${WORKDIR}/QUItIndicators_1.0.1"
>>
>> -require recipes-qt/qt5/qt5.inc
>> +inherit qt5-module
>>
>>   do_install() {
>>       install -d ${D}${datadir}/${P}
>> diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
>> index f79dc0c..fcd7cbf 100644
>> --- a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
>> +++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
>> @@ -1,4 +1,4 @@
>> -require recipes-qt/qt5/qt5.inc
>> +inherit qt5-module
>>
>>   SUMMARY = "Qt Library for ConnMan"
>>   HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
>> diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
>> index 62f17e1..e658690 100644
>> --- a/recipes-qt/qt5/qt3d_git.bb
>> +++ b/recipes-qt/qt5/qt3d_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0"
>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>> index 33620cb..92faf29 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>> diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
>> index c758d04..688d844 100644
>> --- a/recipes-qt/qt5/qtconnectivity_git.bb
>> +++ b/recipes-qt/qt5/qtconnectivity_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
>> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
>> index d186705..273891b 100644
>> --- a/recipes-qt/qt5/qtdeclarative_git.bb
>> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
>> index a0aff8f..2edc931 100644
>> --- a/recipes-qt/qt5/qtenginio_git.bb
>> +++ b/recipes-qt/qt5/qtenginio_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>> diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
>> index 9da5c94..0641f80 100644
>> --- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
>> +++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
>> index 31d4fb0..17784c0 100644
>> --- a/recipes-qt/qt5/qtimageformats_git.bb
>> +++ b/recipes-qt/qt5/qtimageformats_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
>> diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
>> index 12416bb..0264b93 100644
>> --- a/recipes-qt/qt5/qtlocation_git.bb
>> +++ b/recipes-qt/qt5/qtlocation_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
>> diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
>> index bab9bee..abaa28f 100644
>> --- a/recipes-qt/qt5/qtmultimedia_git.bb
>> +++ b/recipes-qt/qt5/qtmultimedia_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
>> index 928963b..994d0bc 100644
>> --- a/recipes-qt/qt5/qtquick1_git.bb
>> +++ b/recipes-qt/qt5/qtquick1_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
>> index af11119..769c191 100644
>> --- a/recipes-qt/qt5/qtquickcontrols_git.bb
>> +++ b/recipes-qt/qt5/qtquickcontrols_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
>> diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
>> index 5751e20..6c1c20c 100644
>> --- a/recipes-qt/qt5/qtscript_git.bb
>> +++ b/recipes-qt/qt5/qtscript_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
>> index ec33355..ee1f579 100644
>> --- a/recipes-qt/qt5/qtsensors_git.bb
>> +++ b/recipes-qt/qt5/qtsensors_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
>> index c59eef6..19748c2 100644
>> --- a/recipes-qt/qt5/qtserialport_git.bb
>> +++ b/recipes-qt/qt5/qtserialport_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
>> diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
>> index 1dce8c6..6350b38 100644
>> --- a/recipes-qt/qt5/qtsvg_git.bb
>> +++ b/recipes-qt/qt5/qtsvg_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
>> index edc0360..6bde2af 100644
>> --- a/recipes-qt/qt5/qtsystems_git.bb
>> +++ b/recipes-qt/qt5/qtsystems_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
>> diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
>> index a4f63c7..e27d6ef 100644
>> --- a/recipes-qt/qt5/qttools_git.bb
>> +++ b/recipes-qt/qt5/qttools_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>> diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
>> index 9341453..75130b7 100644
>> --- a/recipes-qt/qt5/qttranslations_git.bb
>> +++ b/recipes-qt/qt5/qttranslations_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>> diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
>> index 0be7afe..83cdbf4 100644
>> --- a/recipes-qt/qt5/qtwayland_git.bb
>> +++ b/recipes-qt/qt5/qtwayland_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
>> index 8433652..ce5f2fe 100644
>> --- a/recipes-qt/qt5/qtwebchannel_git.bb
>> +++ b/recipes-qt/qt5/qtwebchannel_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
>> index 4b89ddd..3bd75af 100644
>> --- a/recipes-qt/qt5/qtwebengine_git.bb
>> +++ b/recipes-qt/qt5/qtwebengine_git.bb
>> @@ -25,7 +25,7 @@ inherit gettext
>>   inherit pythonnative
>>   inherit perlnative
>>
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # To avoid trouble start with not separated build directory
>> diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
>> index 5fd6436..f98dd63 100644
>> --- a/recipes-qt/qt5/qtwebkit-examples_git.bb
>> +++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
>> index db1a098..674d8ed 100644
>> --- a/recipes-qt/qt5/qtwebkit_git.bb
>> +++ b/recipes-qt/qt5/qtwebkit_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "BSD & LGPLv2+ | GPL-2.0"
>> diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
>> index 85e9156..bd77d52 100644
>> --- a/recipes-qt/qt5/qtwebsockets_git.bb
>> +++ b/recipes-qt/qt5/qtwebsockets_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
>> diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
>> index 6f60f2b..6428711 100644
>> --- a/recipes-qt/qt5/qtx11extras_git.bb
>> +++ b/recipes-qt/qt5/qtx11extras_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
>> diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
>> index da2255a..98bab6e 100644
>> --- a/recipes-qt/qt5/qtxmlpatterns_git.bb
>> +++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
>> @@ -1,4 +1,4 @@
>> -require qt5.inc
>> +inherit qt5-module
>>   require qt5-git.inc
>>
>>   # There are no LGPLv3-only licensed files in this component.
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

