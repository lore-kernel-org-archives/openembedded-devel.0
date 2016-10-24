Return-Path: <msbarth@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id E2F3A71A76
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 16:54:50 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u9OGsOwr119313 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 12:54:51 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
	by mx0a-001b2d01.pphosted.com with ESMTP id 269ke96w9b-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 12:54:51 -0400
Received: from localhost
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-devel@lists.openembedded.org> from
	<msbarth@linux.vnet.ibm.com>; Mon, 24 Oct 2016 12:54:50 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 24 Oct 2016 12:54:49 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
	[9.57.198.27])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id A6021C90041;
	Mon, 24 Oct 2016 12:54:34 -0400 (EDT)
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
	[9.57.199.108])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u9OGsnJA16122364; Mon, 24 Oct 2016 16:54:49 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25DCBB2054;
	Mon, 24 Oct 2016 12:54:49 -0400 (EDT)
Received: from [9.10.99.167] (unknown [9.10.99.167])
	by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTP id E2FCAB2046;
	Mon, 24 Oct 2016 12:54:48 -0400 (EDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1475854216-6859-1-git-send-email-msbarth@linux.vnet.ibm.com>
	<CA+chaQd6QesJQpKBtxuADbAAcYBtMs3tT-_JfqatAwip1uZOBw@mail.gmail.com>
From: msbarth <msbarth@linux.vnet.ibm.com>
Date: Mon, 24 Oct 2016 11:55:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQd6QesJQpKBtxuADbAAcYBtMs3tT-_JfqatAwip1uZOBw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16102416-0040-0000-0000-000001AAB7F5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005971; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000187; SDB=6.00772140; UDB=6.00370581;
	IPR=6.00548955; 
	BA=6.00004826; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013090;
	XFM=3.00000011; UTC=2016-10-24 16:54:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16102416-0041-0000-0000-0000059DC62F
Message-Id: <f7937b85-5a5d-7a80-8d17-9cfb5913a12a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-10-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1610240298
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] autoconf-archive: 2012.04.07 -> 2016.09.16
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
X-List-Received-Date: Mon, 24 Oct 2016 16:54:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

These macros should be provided by the autoconf-archive recipe as 
gnome-common has been deprecated in favour of using the macros from the 
latest upstream autoconf-archive which this patch set is moving to.


On 10/12/2016 03:26 PM, Martin Jansa wrote:
> Some files from this conflict with gnome-common:
> ERROR: autoconf-archive-2016.09.16-r0 do_populate_sysroot: The recipe autoconf-archive is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>     sysroots/qemux86/usr/share/aclocal/ax_check_enable_debug.m4
>   Matched in b'manifest-qemux86-gnome-common.populate_sysroot'
>   sysroots/qemux86/usr/share/aclocal/ax_code_coverage.m4
>   Matched in b'manifest-qemux86-gnome-common.populate_sysroot'
> Please verify which recipe should provide the above files.
>
> On Fri, Oct 7, 2016 at 5:30 PM, Matthew Barth 
> <msbarth@linux.vnet.ibm.com <mailto:msbarth@linux.vnet.ibm.com>> wrote:
>
>     Signed-off-by: Matthew Barth <msbarth@linux.vnet.ibm.com
>     <mailto:msbarth@linux.vnet.ibm.com>>
>     ---
>      meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc  
>     | 7 ++++---
>      ...oconf-archive_2012.04.07.bb
>     <http://oconf-archive_2012.04.07.bb> =>
>     autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>} | 8 +++-----
>      2 files changed, 7 insertions(+), 8 deletions(-)
>      rename
>     meta-oe/recipes-devtools/autoconf-archive/{autoconf-archive_2012.04.07.bb
>     <http://autoconf-archive_2012.04.07.bb> =>
>     autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>} (55%)
>
>     diff --git
>     a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     index 9399363..2b5df70 100644
>     --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     @@ -1,15 +1,16 @@
>     +SUMMARY = "A collection of macros for GNU Autoconf"
>     +DESCRIPTION = "The autoconf-archive set of macros extend the
>     pre-defined \
>     +capabilities within the complete autoconf tool set."
>      LICENSE = "GPLv3"
>      HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/
>     <http://www.gnu.org/software/autoconf-archive/>"
>      SECTION = "devel"
>     -
>      DEPENDS += "m4-native"
>      DEPENDS_class-native = "m4-native gnu-config-native"
>      DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>     -
>      RDEPENDS_${PN} = "m4 gnu-config"
>      RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>      RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>
>     -SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
>     +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>
>      inherit autotools
>     diff --git
>     a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
>     <http://autoconf-archive_2012.04.07.bb>
>     b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     similarity index 55%
>     rename from
>     meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
>     <http://autoconf-archive_2012.04.07.bb>
>     rename to
>     meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     index 5baaecc..1a0470c 100644
>     ---
>     a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
>     <http://autoconf-archive_2012.04.07.bb>
>     +++
>     b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     @@ -1,13 +1,11 @@
>      require autoconf-archive.inc
>
>     -
>     -PARALLEL_MAKE = ""
>     -
>      LICENSE = "GPLv2 & GPLv3"
>      LIC_FILES_CHKSUM =
>     "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>     -SRC_URI[md5sum] = "e842c5b9fae021007bd70550362e5e80"
>     -SRC_URI[sha256sum] =
>     "040b443bf68efd52fbfcb294b556bfbbbfe432db78445ca25e0cfe2e88f96a14"
>     +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
>     +SRC_URI[sha256sum] =
>     "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
>
>      EXTRA_OECONF += "ac_cv_path_M4=m4"
>     +
>      BBCLASSEXTEND = "native nativesdk"
>     --
>     1.9.1
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


