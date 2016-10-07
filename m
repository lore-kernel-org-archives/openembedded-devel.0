Return-Path: <msbarth@linux.vnet.ibm.com>
X-Greylist: delayed 12122 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Oct 2016 18:20:36 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id B3159719BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 18:20:36 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u97Erc3l138694 for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Oct 2016 10:58:35 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
	by mx0a-001b2d01.pphosted.com with ESMTP id 25xash8m8k-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 10:58:35 -0400
Received: from localhost
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-devel@lists.openembedded.org> from
	<msbarth@linux.vnet.ibm.com>; Fri, 7 Oct 2016 10:58:34 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
	by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 7 Oct 2016 10:58:31 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
	[9.57.198.29])
	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 88D776E8048;
	Fri,  7 Oct 2016 10:58:07 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
	[9.57.199.106])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u97EwGuH18612590; Fri, 7 Oct 2016 14:58:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8621B28050;
	Fri,  7 Oct 2016 10:58:30 -0400 (EDT)
Received: from [9.10.99.167] (unknown [9.10.99.167])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 52CF82803F;
	Fri,  7 Oct 2016 10:58:30 -0400 (EDT)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <1475789066-4308-1-git-send-email-msbarth@linux.vnet.ibm.com>
	<ADEE5812-4155-4506-B9A5-3029E3B58CDB@gmail.com>
From: msbarth <msbarth@linux.vnet.ibm.com>
Date: Fri, 7 Oct 2016 09:58:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <ADEE5812-4155-4506-B9A5-3029E3B58CDB@gmail.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100714-0040-0000-0000-0000018811B0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005868; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000186; SDB=6.00765518; UDB=6.00365806;
	IPR=6.00541376; 
	BA=6.00004792; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012906;
	XFM=3.00000011; UTC=2016-10-07 14:58:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100714-0041-0000-0000-0000057B2EA4
Message-Id: <d2f7c268-61e6-04b1-07ea-7c749f2e5ca6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-07_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1610070258
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] autoconf-archive: 2012.04.07 -> 2016.09.16
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
X-List-Received-Date: Fri, 07 Oct 2016 18:20:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/06/2016 06:49 PM, Khem Raj wrote:
>> On Oct 6, 2016, at 2:24 PM, Matthew Barth <msbarth@linux.vnet.ibm.com> wrote:
>>
>> Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com>
>> ---
>> meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc     | 7 ++++---
>> ...toconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} | 6 +++---
>> 2 files changed, 7 insertions(+), 6 deletions(-)
>> rename meta-oe/recipes-devtools/autoconf-archive/{autoconf-archive_2012.04.07.bb => autoconf-archive_2016.09.16.bb} (61%)
>>
>> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>> index 9399363..2b5df70 100644
>> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>> @@ -1,15 +1,16 @@
>> +SUMMARY = "A collection of macros for GNU Autoconf"
>> +DESCRIPTION = "The autoconf-archive set of macros extend the pre-defined \
>> +capabilities within the complete autoconf tool set."
>> LICENSE = "GPLv3"
>> HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
>> SECTION = "devel"
>> -
>> DEPENDS += "m4-native"
>> DEPENDS_class-native = "m4-native gnu-config-native"
>> DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>> -
>> RDEPENDS_${PN} = "m4 gnu-config"
>> RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>> RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>>
>> -SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
>> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>>
>> inherit autotools
>> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>> similarity index 61%
>> rename from meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
>> rename to meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>> index 5baaecc..da648c2 100644
>> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
>> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>> @@ -1,13 +1,13 @@
>> require autoconf-archive.inc
>>
>> -
>> PARALLEL_MAKE = “"
> Do we still need this ?
Most likely for this package, no. I have built successfully a few times 
without, however since this was likely originally added due to a race 
condition that doesnt conclude it can be removed, so I left it in.
>> LICENSE = "GPLv2 & GPLv3"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
>> -SRC_URI[md5sum] = "e842c5b9fae021007bd70550362e5e80"
>> -SRC_URI[sha256sum] = "040b443bf68efd52fbfcb294b556bfbbbfe432db78445ca25e0cfe2e88f96a14"
>> +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
>> +SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
>>
>> EXTRA_OECONF += "ac_cv_path_M4=m4"
>> +
>> BBCLASSEXTEND = "native nativesdk"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


