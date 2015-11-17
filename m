Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0140.outbound.protection.outlook.com [157.55.234.140])
	by mail.openembedded.org (Postfix) with ESMTP id A6EAD6010B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 14:28:47 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from [10.9.5.47] (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.325.17; Tue, 17 Nov 2015 14:28:45 +0000
To: <openembedded-devel@lists.openembedded.org>
References: <1446816009-14836-1-git-send-email-samuli.piippo@theqtcompany.com>
	<20151116220304.GH2240@jama>
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <564B39A2.2090606@theqtcompany.com>
Date: Tue, 17 Nov 2015 16:28:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151116220304.GH2240@jama>
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA032.eurprd01.prod.exchangelabs.com (10.141.191.22)
	To DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:xJSXRyyaH2iOMP13YtTWZZIE7aaaKb0I6cLcxv7mnPCpiYtNucVVkhYQfNH16JaqjP97aY53vD856JJvkn/3G4J+5+PYBD22mtQldzwoLSiGECT60lR/BdsHWxazO+cDS1lVkcXTjaxXsgHxxVgesAMg2ny8jcG8MPOlS+GVcpY=;
	3:PZxZ7QREM2pJ3e56edQ1sNUWa9BTeUCTw1XyWifc7utniym2pWXTKZiqMo/BeppwV9Cp6Wbl6evgWCESBa6Z7y8WUXyhi3f9/vA4hgDtUD4ecrdEI0ozmMCwiKobWOsrl1hEkI7twrrV7vAaxC1+9w==;
	25:GzUWZ9/t3nMNk73ERJ7Xp7AiZjlWzm+oaKv/ZUR2jSGiD5qxCq+MbumGhXVzmNDwPxNo0t1/krrI3jPvMgn07VhpkXVQRRiJArQtaoBJxBRXogKCRAz+bNRmy74DGV8TMPn+L8yUcSovX619wPjcIPwQWYGsCnBFtrMGE73iOXPTIzi2HrurOVs4txN3wmJRsBTNjMxO+HUgsPDcrZTH4id27utqvZ4kwhWex0R86zJttllipZceykY53ENIzKgFIVPKJPuz3qkw/f8wf7N97w==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:Hw/VLl485UgbX/o1+L/W+rbUfj1AdwZFRJZ/W6TqzqAbMD51XmurFp1sReWdYFUd8V4wbYeRtlbE3Ghl1Wsq6rV6HrjlTFaXyAWYfXBXoDxGYzITcE2w6SOP27YczioTodnGAFlamd+Dlzkbx24L93vefXV9v2J4veKDR1NURRilq5LCeA0vMoQu+Y/gMO77KGuFSY1ouO3JcWGMVjr6JzSIrxikuGeXG6huIpIC57R2UeUcLTBPoHzOtQ1JVA2XDibLDZhLHH+K+Mv4y/pRBnL6XGQPRU/yHcuRYjO7A3bJoPUaY/g513Y6+XvECJfbKbNdkzzwq6gFxxh0h7fXm/K2nhdXb/7ak2M7wxzMAhk4tzRJ734VRI8siO7SYhYjZyI1fqklxFTfV5LZbe5axzppzqExip2uEEWl56OFlx4s68epp46c9Oa4QPXHne/g9r07OpB8U4NO9gKNagq/dWBAKjMhk2tspCbF1MHdXGAwUIDIOnQ38LskPkyd/fma;
	4:X4gB9NzL7HAfcXLLH8gOk2oAvmVKbveMNptk4EzwShp8qCnf0QpihvBVt/qGNY2LkfcFPEnRK7sLYx1G5IkyJW8+i6g9SAK8wHIEbrvu8ecKdUpI8udQFYWVcpqkSfOUB38fqYpvS2Ip1zdyXhDwFVQroMBjzvTCCtoLQYHOMRrghom5rUO5ObJ96O+P30dBy1P7M/o0mmd+eAX9TmD+9MAnehcGYjYRmEvvORATCHtnu0Yq0Pyb016Fr+7F6p4XOcMO1JnFeF7ekaCAsLWd1FKejLP6pykjj4mKOJ8i5MfHyibwPwPtKK0XQxSvR6DYsnL3eBn08NJ4DSaRWahY+SQVoXHotGMeOw/n+psFKAl66/0VlN/XsJrFyaviwGcH
X-Microsoft-Antispam-PRVS: <DB5PR02MB1175471725A71FAD20061EB7901D0@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 07630F72AD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(199003)(24454002)(189002)(54094003)(230700001)(230783001)(83506001)(65806001)(42186005)(106356001)(101416001)(92566002)(5004730100002)(65956001)(86362001)(47776003)(59896002)(19580405001)(66066001)(80316001)(105586002)(575784001)(40100003)(122386002)(23746002)(19580395003)(2351001)(1720100001)(2950100001)(33656002)(36756003)(64126003)(107886002)(97736004)(5001920100001)(76176999)(87976001)(5007970100001)(586003)(189998001)(15975445007)(77096005)(4001350100001)(65816999)(81156007)(110136002)(5001960100002)(87266999)(54356999)(50986999)(50466002)(450100001)(5008740100001)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:[10.9.5.47];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DB5PR02MB1175;
	23:Rh/C7ij1+WK8JKRrU7anYbmUBynonDQWHamcw?=
	=?Windows-1252?Q?ajfdSAkPBiWZ4GNnQH/W56AHLFIXG6qxL9Ov7rWSvGwfd1+3jDDzKgtm?=
	=?Windows-1252?Q?detfHO+La4keF3gcjxaU1/x9DlVFtmtIOjgy0MzoKXGvBPg+uvzfvpGP?=
	=?Windows-1252?Q?cRdgb55joGOEOjyLntPNsCYj9SA+R+94qMueNZpMMw4XGI1HU6t2n902?=
	=?Windows-1252?Q?fidE/1sv2duuSepRI8NEMhR6mCMvlHVkFx2ApzTbwTiQG/mJW2T+5/Cg?=
	=?Windows-1252?Q?mcAoihH531EVgQTiaU8CV8eVFVwmXOj/zccmBO7ONGgycxS3ES+a2bBX?=
	=?Windows-1252?Q?dgLH0NgHouejVSEX5USczo66Qi++z4CclMqtO1bPj+yoX9iKqKJYgkX7?=
	=?Windows-1252?Q?XLq62A0i+G6lWevZHCL6dtOffintMw2eh5SHClj3MRnuaosgEApz1Dpt?=
	=?Windows-1252?Q?NnMttKX9lrFS3ZGqAx7d5uJ2mh1Bl1WT69xN6VAtKZ89m8mS8YRkAjT2?=
	=?Windows-1252?Q?MdVIUSIfpD2vl2Zkl2TIvG73CQhdwVxdKjZHBaYzQmdP1ulapAAPuOsa?=
	=?Windows-1252?Q?7sKk9NcoPSOarkwiIwYKE4eRAEyR8bRQQSJGblAOzwnZgRTcbyex+hQP?=
	=?Windows-1252?Q?liJtieDI6ejs/HChqR9EYIJE8wQWW93M2XtQU/Vb+sF5GOEW4bGae/W5?=
	=?Windows-1252?Q?5rd65GUAWgQcj1M9v1UnTSiwSs5aXtNCvAyG47/vDsvTjFWxxB7syIJP?=
	=?Windows-1252?Q?buwyyiC1pwgHZGJzZW2WEXYTAhf/xOKSX+HwHoLFJ0pxm3fOgjYoKodu?=
	=?Windows-1252?Q?+EZ4E8nUDCMZCxu4KNf4c6ac0fRk/H6Vu0f6ryd8uyQsplsP44wZII/x?=
	=?Windows-1252?Q?UTxKm2TQyTZ+VyZz1oo9H5FZP0aD3/F4sD7tWFb31MRh0OxD8QharUiW?=
	=?Windows-1252?Q?S3hRjccEF/h1CVa8oJi/L1MFT8WlQ6Gv6v3Tg+iLPkh2f/8HDkb5CPt1?=
	=?Windows-1252?Q?Ws6bdNMSwv2gHvEdCsf78mEJXjPgo4JcIbk0EyPOSCG/UY7fwZj89qVs?=
	=?Windows-1252?Q?r7z2sVidOxyz9jWc3Xe2FXFfvne+slAfS764WZsxU61/Ek3XN2oFqTza?=
	=?Windows-1252?Q?Vxs387WOvTpQ/p7W+VWGk3VNVMe/YFfeL7CvuEAJruB9iYTN9FktcKs1?=
	=?Windows-1252?Q?UdiVk6YM8eNXvUA6sV+DfNKvPp6D9UvoXLur2udcmJ5XbxEPRuJjuXag?=
	=?Windows-1252?Q?D/kplnX23Frgus78fZeDc1SmM2PZ1l2asPTIyJuOSPpdb/g+eoaJa+Fd?=
	=?Windows-1252?Q?H1eepb2pvdVT3WgxqdoAEiHXxJPD+eEO8u3sYB24EAdvHO6DUWUPIZuY?=
	=?Windows-1252?Q?gLEeO3h/T0n/3jOIfswvWwSb3YWppoHZWKY0qcXgd8mpDvTQO8qQ/Z8M?=
	=?Windows-1252?Q?LM6RMxb4EzEy8gAylI2ErVw5ZHbIOJHYWwU70/Ln+J1YRz7qG5XYbs8/?=
	=?Windows-1252?Q?/FER4o87ZTWgfkkMpNuyXh7dc+iHVrqleZd/x3ah0nx3u44necZIxNNg?=
	=?Windows-1252?Q?VF4KG5f+BKJ2EE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:tlvI+KYC3nsGmusttMcEQDQsMpskfjcksCV4Blcza7yanHBc+gFpAP+Vz0YKupwmgKh3cIu9NHv2RMKXYkraXLsMH/0X7AKRFANVjIxBjAwGj+IMjJmsO34Ktfwp96urWaTn/dBEWxfpi+HnrnxoWQ==;
	24:ehV3yZElMsX/XuIi84KStaBONjo3B0+uRnYy2aT8fPpCrwbUFXvlxXFzYkzaV7K7gGfWQrpKHif89Bm8ywYFg8kmWSdbA7FXE4KO/Rp62uQ=;
	20:DtfB1lDJMoRRsTh+G5UFTA6Q9ilSkEnhSu2C0ggmY+s03IpXekRSosvrSDtdw6HEnduPccXJMuJByvr12kJp3w==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2015 14:28:45.7651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: Re: [meta-qt5][PATCHv2] qtbase: support oe-device-extra.pri in configure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Nov 2015 14:28:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 17.11.2015 00:03, Martin Jansa wrote:
> On Fri, Nov 06, 2015 at 03:20:09PM +0200, Samuli Piippo wrote:
>> configure parses through the mkspec, but does not handle conditions
>> at all, so oe-device-extra.pri was not included at configure phase.
>> For example QT_QPA_DEFAULT_PLATFORM had no effect for configure.
>> With include() on a separate line, oe-device-extra.pri is correctly
>> included also in configure.
>
> Please resend version applicable for 5.6 in master branch (this will be
> merged to jethro after more testing in master branch).

This still produces few warning lines to configure output. I wonder if 
it would be better to change the patch so that it creates an empty 
oe-device-extra.pri file? It would then always be available and easily 
patched/overwritten when needed.

-samuli

>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>> ---
>>   recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> index a9c448d..0826ba1 100644
>> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
>> @@ -45,9 +45,9 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>   ---
>>    configure                            |  70 +++++++++++++++---------
>>    mkspecs/features/configure.prf       |   4 +-
>> - mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
>> + mkspecs/linux-oe-g++/qmake.conf      |  44 +++++++++++++++
>>    mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
>> - 4 files changed, 188 insertions(+), 28 deletions(-)
>> + 4 files changed, 190 insertions(+), 28 deletions(-)
>>    create mode 100644 mkspecs/linux-oe-g++/qmake.conf
>>    create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
>>
>> @@ -200,7 +200,7 @@ new file mode 100644
>>   index 0000000..d0a4166
>>   --- /dev/null
>>   +++ b/mkspecs/linux-oe-g++/qmake.conf
>> -@@ -0,0 +1,42 @@
>> +@@ -0,0 +1,44 @@
>>   +#
>>   +# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
>>   +#
>> @@ -240,7 +240,9 @@ index 0000000..d0a4166
>>   +# for the SDK
>>   +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
>>   +
>> -+exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
>> ++exists(../oe-device-extra.pri) {
>> ++  include(../oe-device-extra.pri)
>> ++}
>>   +
>>   +load(qt_config)
>>   diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
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

