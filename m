Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id BDB716FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 08:32:10 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n85so4164094pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=vPEzfQ+1LuXxl5xwmZbZB29fVzf3ZmBopF5e7h9tzyY=;
	b=AazXvRszA/Fpqz7goUKTXQsVdxsV98vE1NUmdINR/a1kBQGPfTRX2lNjT2hI/pVWdS
	puP5O9EKN3OaOZg7P4MZIRGGLctttTge+AJPMkVHQ4G8zz8SbUW01V/cdjP1qnSn+5Qf
	N3dLZhAWgjPW8a4MPtQb8lcDu/axjeVQOwC/ogXTtczEAmhdT03G5SCw0iAHv8hhVDUs
	ZvKdgw8cIv3SM4eGMovdFa8Jh2Xchtnnno6yaZ5+5KZg5O2FAP2g7nZYhaaU8bU47VGT
	zo7I5uQIzkiZg4YiHYjP8bO8ycZE1b2JsxDUugKxtcA+joxZAOW58duGRRFvK2gcG9Ul
	yM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=vPEzfQ+1LuXxl5xwmZbZB29fVzf3ZmBopF5e7h9tzyY=;
	b=LfRjLEG7iRPBLfrpNN9PBWTfcz0BbBwuWJispQ9ZLgPb4eR2FgEaAhDpF0q6KxMl4j
	QuHxkuTMEjfy5MRnbeaIgz0iIBOxo3OclbL41Ge2u53PmToWkcynS8XULp0SOmR3BXcL
	EY+sy6vwIEwrFUIgj22ZcKyWJebMlCs/SgjFwi+WmquRvbP8C61M5hAlNsn5BQdWt3kb
	cS1VP3O4rj27OBZsD/UzQ2mHIvak1kUsiikQMr1Mt8a5VQneEvCvl1JoPjEZ+EWbd3kF
	ZS3M1QhT1KQHomHUWklNSW5pfhk9hR39R2g2m0VgIp86JZqPVZP1/9+gQ/G7mLeCLxof
	nkGQ==
X-Gm-Message-State: ABUngveVfTeq6EwJRDf3HLQMwVrYMXTV7OMWi4PhszunokykNszu12obd084akl5R7Nbvw==
X-Received: by 10.98.34.7 with SMTP id i7mr14518386pfi.145.1478161930707;
	Thu, 03 Nov 2016 01:32:10 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:99b5:6af1:c0c3:9e76?
	([2601:646:8882:b8c:99b5:6af1:c0c3:9e76])
	by smtp.gmail.com with ESMTPSA id
	t5sm10467605pfb.58.2016.11.03.01.32.09
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 01:32:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <B576460C-5A20-46FF-A699-A336FDFD4624@dominion.thruhere.net>
Date: Thu, 3 Nov 2016 01:32:03 -0700
Message-Id: <ABE107B5-2CFC-4968-B905-5E353D8CF5B5@gmail.com>
References: <20161103082038.6331-1-raj.khem@gmail.com>
	<20161103082038.6331-7-raj.khem@gmail.com>
	<B576460C-5A20-46FF-A699-A336FDFD4624@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 7/7] kodi: Update to krypton release ( 17.x )
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
X-List-Received-Date: Thu, 03 Nov 2016 08:32:10 -0000
X-Groupsio-MsgNum: 63708
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DEB7E46A-0C3B-4727-9DF6-EB36E84A053C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DEB7E46A-0C3B-4727-9DF6-EB36E84A053C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 3, 2016, at 1:26 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>=20
> Since 17 hasn=E2=80=99t been released yet, I think adding 16.1 first =
would be a better idea. That one is known working on the 4 archs I test =
it on (armv7a, aarch64, x86 and x86_64), version 17 is still in flux.

17.0-beta5 has been working quite well on RPI3 here as well as x86

>=20
> Regardless of that, thanks for taking the time to =E2=80=98port=E2=80=99=
 this all back to meta-oe.
>=20
>> Op 3 nov. 2016, om 09:20 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:
>>=20
>> remove obsoleted xbmc recipes
>> rename to recipes-mediacenter
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../kodi/jsonschemabuilder-native.bb               |  24 ++
>> .../0001-Update-to-p8-platform.patch               | 427 =
+++++++++++++++++++++
>> .../kodi/kodi-addon-pvr-hts_git.bb                 |  55 +++
>> .../0001-Fix-build-after-platform-rename.patch     |  67 ++++
>> .../0001-fix-cross-compile-badness.patch           |  40 ++
>> .../kodi-platform-02_no-multi-lib.patch            |  12 +
>> .../recipes-mediacenter/kodi/kodi-platform_git.bb  |  39 ++
>> .../recipes-mediacenter/kodi/kodi-startup.bb       |  20 +
>> .../kodi/kodi-startup/kodi.service                 |  14 +
>> ...re-don-t-try-to-run-stuff-to-find-tinyxml.patch |  25 ++
>> .../kodi/kodi/0002-handle-SIGTERM.patch            | 163 ++++++++
>> ...-to-read-frequency-output-if-using-intel-.patch |  26 ++
>> .../kodi/kodi/0004-Disable-DVD-support.patch       |  35 ++
>> .../recipes-mediacenter/kodi/kodi_17.bb            | 177 +++++++++
>> ...on-t-run-python-distutils-to-find-STAGING.patch |  31 --
>> ...d-ios-Add-memory-barriers-to-atomic-Add-S.patch |  97 -----
>> ...d-ios-Add-memory-barriers-to-cas-assembly.patch |  69 ----
>> ...igure-cope-with-ld-is-gold-DISTRO_FEATURE.patch |  43 ---
>> .../xbmc/configure.in-Avoid-running-code.patch     |  32 --
>> .../recipes-mediacentre/xbmc/xbmc_git.bb           |  97 -----
>> 20 files changed, 1124 insertions(+), 369 deletions(-)
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts/0001-Update-to=
-p8-platform.patch
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-afte=
r-platform-rename.patch
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-fix-cross-comp=
ile-badness.patch
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi-platform/kodi-platform-02_no=
-multi-lib.patch
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi/0001-configure-don-t-try-to-=
run-stuff-to-find-tinyxml.patch
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi/0002-handle-SIGTERM.patch
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi/0003-add-support-to-read-fre=
quency-output-if-using-intel-.patch
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi/0004-Disable-DVD-support.pat=
ch
>> create mode 100644 =
meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
>> delete mode 100644 =
meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-pyt=
hon-distutils-to-find-STAGING.patch
>> delete mode 100644 =
meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-me=
mory-barriers-to-atomic-Add-S.patch
>> delete mode 100644 =
meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-me=
mory-barriers-to-cas-assembly.patch
>> delete mode 100644 =
meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-ld-=
is-gold-DISTRO_FEATURE.patch
>> delete mode 100644 =
meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running-c=
ode.patch
>> delete mode 100644 =
meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>>=20
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb =
b/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
>> new file mode 100644
>> index 0000000..094ccff
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY =3D "Kodi Media Center"
>> +
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D =
"file://JsonSchemaBuilder.cpp;beginline=3D2;endline=3D18;md5=3D1f67721215c=
03f66545390f6e45b99c7"
>> +
>> +SRCREV =3D "b587e98911fcedc4b800cd923a882c7aeeaa2146"
>> +
>> +PV =3D "16.0+gitr${SRCPV}"
>> +SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3DJarvis"
>> +
>> +inherit autotools-brokensep gettext native
>> +
>> +S =3D "${WORKDIR}/git/tools/depends/native/JsonSchemaBuilder/src"
>> +
>> +do_compile_prepend() {
>> +    for i in $(find . -name "Makefile") ; do
>> +        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
>> +    done
>> +
>> +    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
>> +        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e =
's:-rpath \$(libdir):-rpath ${libdir}:g' $i
>> +    done
>> +}
>> +
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts/0001-Update-=
to-p8-platform.patch =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts/0001-Update-=
to-p8-platform.patch
>> new file mode 100644
>> index 0000000..c4a6ae7
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts/0001-Update-=
to-p8-platform.patch
>> @@ -0,0 +1,427 @@
>> +=46rom 06a8224c99282ac1a606edd9e8ea3f591112942d Mon Sep 17 00:00:00 =
2001
>> +From: Koen Kooi <koen@dominion.thruhere.net>
>> +Date: Thu, 18 Feb 2016 14:04:31 +0100
>> +Subject: [PATCH] Update to p8-platform
>> +
>> +---
>> + CMakeLists.txt                         |  6 +++---
>> + pvr.hts/changelog.txt                  |  4 ++--
>> + src/AutoRecordings.cpp                 |  2 +-
>> + src/HTSPConnection.cpp                 |  8 +++----
>> + src/HTSPDemuxer.cpp                    |  2 +-
>> + src/HTSPVFS.cpp                        |  6 +++---
>> + src/TimeRecordings.cpp                 |  2 +-
>> + src/Tvheadend.cpp                      |  4 ++--
>> + src/Tvheadend.h                        | 38 =
+++++++++++++++++-----------------
>> + src/client.cpp                         |  4 ++--
>> + src/client.h                           |  4 ++--
>> + src/tvheadend/Subscription.cpp         |  2 +-
>> + src/tvheadend/Subscription.h           |  4 ++--
>> + src/tvheadend/utilities/AsyncState.cpp |  4 ++--
>> + src/tvheadend/utilities/AsyncState.h   |  6 +++---
>> + 15 files changed, 48 insertions(+), 48 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 0842682..cb04942 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -6,10 +6,10 @@ enable_language(CXX)
>> +
>> + find_package(kodi REQUIRED)
>> + find_package(kodiplatform REQUIRED)
>> +-find_package(platform REQUIRED)
>> ++find_package(p8-platform REQUIRED)
>> +
>> + include_directories(${kodiplatform_INCLUDE_DIRS}
>> +-                    ${platform_INCLUDE_DIRS}
>> ++                    ${p8-platform_INCLUDE_DIRS}
>> +                     ${KODI_INCLUDE_DIR}
>> +                     ${PROJECT_SOURCE_DIR}/lib)
>> +
>> +@@ -95,7 +95,7 @@ list(APPEND HTS_SOURCES
>> +
>> + add_subdirectory(lib/libhts)
>> +
>> +-set(DEPLIBS ${platform_LIBRARIES} hts)
>> ++set(DEPLIBS ${p8-platform_LIBRARIES} hts)
>> + if(WIN32)
>> +   list(APPEND DEPLIBS ws2_32)
>> + endif()
>> +diff --git a/pvr.hts/changelog.txt b/pvr.hts/changelog.txt
>> +index 9ffa33c..1e7fe30 100644
>> +--- a/pvr.hts/changelog.txt
>> ++++ b/pvr.hts/changelog.txt
>> +@@ -49,7 +49,7 @@
>> + - fixed: Autorec: Start and stop time handling.
>> + - fixed: LocaltimeToUTC conversion (timer settings clock display =
incorrect).
>> + - fixed: Several issues with predictive tuning.
>> +-- added: build: Automatically fill in platform and library name.
>> ++- added: build: Automatically fill in p8-platform and library name.
>> + - fixed: Use epg data only for creation of epg-based timers.
>> + - improved: Do not try to reconnect to tvh while suspending or not =
fully awake again.
>> +
>> +@@ -97,7 +97,7 @@
>> + - added: support for creating repeating timers, aka time schedules
>> + - fixed: conditions for addon restart after settings changes
>> + - internal: fixed build system regressions introduced with move to =
cmake
>> +-- internal: updated to use libplatform
>> ++- internal: updated to use libp8-platform
>> +
>> + 2.1.7
>> + - added: support for radio channel groups
>> +diff --git a/src/AutoRecordings.cpp b/src/AutoRecordings.cpp
>> +index 5fa60a0..d9e5e1d 100644
>> +--- a/src/AutoRecordings.cpp
>> ++++ b/src/AutoRecordings.cpp
>> +@@ -26,7 +26,7 @@
>> + #include "tvheadend/utilities/Utilities.h"
>> + #include "tvheadend/utilities/Logger.h"
>> +
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> + using namespace tvheadend;
>> + using namespace tvheadend::entity;
>> + using namespace tvheadend::utilities;
>> +diff --git a/src/HTSPConnection.cpp b/src/HTSPConnection.cpp
>> +index aec1296..86f5004 100644
>> +--- a/src/HTSPConnection.cpp
>> ++++ b/src/HTSPConnection.cpp
>> +@@ -19,9 +19,9 @@
>> +  *
>> +  */
>> +
>> +-#include "platform/threads/mutex.h"
>> +-#include "platform/util/StringUtils.h"
>> +-#include "platform/sockets/tcp.h"
>> ++#include "p8-platform/threads/mutex.h"
>> ++#include "p8-platform/util/StringUtils.h"
>> ++#include "p8-platform/sockets/tcp.h"
>> +
>> + extern "C" {
>> + #include "libhts/htsmsg_binary.h"
>> +@@ -33,7 +33,7 @@ extern "C" {
>> +
>> + using namespace std;
>> + using namespace ADDON;
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> + using namespace tvheadend;
>> + using namespace tvheadend::utilities;
>> +
>> +diff --git a/src/HTSPDemuxer.cpp b/src/HTSPDemuxer.cpp
>> +index a6e1f12..7f45345 100644
>> +--- a/src/HTSPDemuxer.cpp
>> ++++ b/src/HTSPDemuxer.cpp
>> +@@ -27,7 +27,7 @@
>> +
>> + using namespace std;
>> + using namespace ADDON;
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> + using namespace tvheadend;
>> + using namespace tvheadend::utilities;
>> +
>> +diff --git a/src/HTSPVFS.cpp b/src/HTSPVFS.cpp
>> +index 0463f56..0404bab 100644
>> +--- a/src/HTSPVFS.cpp
>> ++++ b/src/HTSPVFS.cpp
>> +@@ -19,8 +19,8 @@
>> +  *
>> +  */
>> +
>> +-#include "platform/threads/mutex.h"
>> +-#include "platform/util/StringUtils.h"
>> ++#include "p8-platform/threads/mutex.h"
>> ++#include "p8-platform/util/StringUtils.h"
>> + #include "tvheadend/utilities/Logger.h"
>> +
>> + extern "C" {
>> +@@ -30,7 +30,7 @@ extern "C" {
>> + #include "Tvheadend.h"
>> +
>> + using namespace std;
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> + using namespace tvheadend::utilities;
>> +
>> + /*
>> +diff --git a/src/TimeRecordings.cpp b/src/TimeRecordings.cpp
>> +index 5d34938..97aae09 100644
>> +--- a/src/TimeRecordings.cpp
>> ++++ b/src/TimeRecordings.cpp
>> +@@ -25,7 +25,7 @@
>> + #include "tvheadend/utilities/Utilities.h"
>> + #include "tvheadend/utilities/Logger.h"
>> +
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> + using namespace tvheadend;
>> + using namespace tvheadend::entity;
>> + using namespace tvheadend::utilities;
>> +diff --git a/src/Tvheadend.cpp b/src/Tvheadend.cpp
>> +index 2057241..14c3bd4 100644
>> +--- a/src/Tvheadend.cpp
>> ++++ b/src/Tvheadend.cpp
>> +@@ -23,7 +23,7 @@
>> + #include <ctime>
>> + #include <memory>
>> +
>> +-#include "platform/util/StringUtils.h"
>> ++#include "p8-platform/util/StringUtils.h"
>> +
>> + #include "Tvheadend.h"
>> + #include "tvheadend/utilities/Utilities.h"
>> +@@ -31,7 +31,7 @@
>> +
>> + using namespace std;
>> + using namespace ADDON;
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> + using namespace tvheadend;
>> + using namespace tvheadend::entity;
>> + using namespace tvheadend::utilities;
>> +diff --git a/src/Tvheadend.h b/src/Tvheadend.h
>> +index 2ce4552..e794716 100644
>> +--- a/src/Tvheadend.h
>> ++++ b/src/Tvheadend.h
>> +@@ -22,10 +22,10 @@
>> +  */
>> +
>> + #include "client.h"
>> +-#include "platform/sockets/tcp.h"
>> +-#include "platform/threads/threads.h"
>> +-#include "platform/threads/mutex.h"
>> +-#include "platform/util/buffer.h"
>> ++#include "p8-platform/sockets/tcp.h"
>> ++#include "p8-platform/threads/threads.h"
>> ++#include "p8-platform/threads/mutex.h"
>> ++#include "p8-platform/util/buffer.h"
>> + #include "kodi/xbmc_codec_types.h"
>> + #include "kodi/xbmc_stream_utils.hpp"
>> + #include "kodi/libXBMC_addon.h"
>> +@@ -88,7 +88,7 @@ class CHTSPMessage;
>> +
>> + /* Typedefs */
>> + typedef std::map<uint32_t,CHTSPResponse*> CHTSPResponseList;
>> +-typedef PLATFORM::SyncedBuffer<CHTSPMessage> CHTSPMessageQueue;
>> ++typedef P8PLATFORM::SyncedBuffer<CHTSPMessage> CHTSPMessageQueue;
>> +
>> + /*
>> +  * HTSP Response handler
>> +@@ -98,10 +98,10 @@ class CHTSPResponse
>> + public:
>> +   CHTSPResponse();
>> +   ~CHTSPResponse();
>> +-  htsmsg_t *Get ( PLATFORM::CMutex &mutex, uint32_t timeout );
>> ++  htsmsg_t *Get ( P8PLATFORM::CMutex &mutex, uint32_t timeout );
>> +   void      Set ( htsmsg_t *m );
>> + private:
>> +-  PLATFORM::CCondition<volatile bool> m_cond;
>> ++  P8PLATFORM::CCondition<volatile bool> m_cond;
>> +   bool                                m_flag;
>> +   htsmsg_t                           *m_msg;
>> + };
>> +@@ -146,7 +146,7 @@ public:
>> +  * HTSP Connection registration thread
>> +  */
>> + class CHTSPRegister
>> +-  : public PLATFORM::CThread
>> ++  : public P8PLATFORM::CThread
>> + {
>> +   friend class CHTSPConnection;
>> +
>> +@@ -163,7 +163,7 @@ private:
>> +  * HTSP Connection
>> +  */
>> + class CHTSPConnection
>> +-  : public PLATFORM::CThread
>> ++  : public P8PLATFORM::CThread
>> + {
>> +   friend class CHTSPRegister;
>> +
>> +@@ -190,7 +190,7 @@ public:
>> +   inline bool IsConnected       ( void ) const { return m_ready; }
>> +   bool        WaitForConnection ( void );
>> +
>> +-  inline PLATFORM::CMutex& Mutex ( void ) { return m_mutex; }
>> ++  inline P8PLATFORM::CMutex& Mutex ( void ) { return m_mutex; }
>> +
>> +   void        OnSleep ( void );
>> +   void        OnWake  ( void );
>> +@@ -202,10 +202,10 @@ private:
>> +   bool        SendHello        ( void );
>> +   bool        SendAuth         ( const std::string &u, const =
std::string &p );
>> +
>> +-  PLATFORM::CTcpSocket               *m_socket;
>> +-  PLATFORM::CMutex                    m_mutex;
>> ++  P8PLATFORM::CTcpSocket               *m_socket;
>> ++  P8PLATFORM::CMutex                    m_mutex;
>> +   CHTSPRegister                       m_regThread;
>> +-  PLATFORM::CCondition<volatile bool> m_regCond;
>> ++  P8PLATFORM::CCondition<volatile bool> m_regCond;
>> +   bool                                m_ready;
>> +   uint32_t                            m_seq;
>> +   std::string                         m_serverName;
>> +@@ -273,13 +273,13 @@ public:
>> +   void SetStreamingProfile(const std::string &profile);
>> +
>> + private:
>> +-  PLATFORM::CMutex                        m_mutex;
>> ++  P8PLATFORM::CMutex                        m_mutex;
>> +   CHTSPConnection                        &m_conn;
>> +-  PLATFORM::SyncedBuffer<DemuxPacket*>    m_pktBuffer;
>> ++  P8PLATFORM::SyncedBuffer<DemuxPacket*>    m_pktBuffer;
>> +   ADDON::XbmcStreamProperties             m_streams;
>> +   std::map<int,int>                       m_streamStat;
>> +   int64_t                                 m_seekTime;
>> +-  PLATFORM::CCondition<volatile int64_t>  m_seekCond;
>> ++  P8PLATFORM::CCondition<volatile int64_t>  m_seekCond;
>> +   bool                                    m_seeking;
>> +   bool                                    m_speedChange;
>> +   tvheadend::status::SourceInfo           m_sourceInfo;
>> +@@ -350,7 +350,7 @@ private:
>> +  * Root object for Tvheadend connection
>> +  */
>> + class CTvheadend
>> +-  : public PLATFORM::CThread
>> ++  : public P8PLATFORM::CThread
>> + {
>> + public:
>> +   CTvheadend();
>> +@@ -422,7 +422,7 @@ private:
>> +    */
>> +   tvheadend::Profiles         m_profiles;
>> +
>> +-  PLATFORM::CMutex            m_mutex;
>> ++  P8PLATFORM::CMutex            m_mutex;
>> +
>> +   CHTSPConnection             m_conn;
>> +
>> +@@ -519,7 +519,7 @@ public:
>> +    */
>> +   bool WaitForConnection ( void )
>> +   {
>> +-    PLATFORM::CLockObject lock(m_conn.Mutex());
>> ++    P8PLATFORM::CLockObject lock(m_conn.Mutex());
>> +     return m_conn.WaitForConnection();
>> +   }
>> +   std::string GetServerName    ( void )
>> +diff --git a/src/client.cpp b/src/client.cpp
>> +index 94d2db9..3295914 100644
>> +--- a/src/client.cpp
>> ++++ b/src/client.cpp
>> +@@ -22,14 +22,14 @@
>> + #include "client.h"
>> + #include "kodi/xbmc_pvr_dll.h"
>> + #include "kodi/libKODI_guilib.h"
>> +-#include "platform/util/util.h"
>> ++#include "p8-platform/util/util.h"
>> + #include "Tvheadend.h"
>> + #include "tvheadend/Settings.h"
>> + #include "tvheadend/utilities/Logger.h"
>> +
>> + using namespace std;
>> + using namespace ADDON;
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> + using namespace tvheadend;
>> + using namespace tvheadend::utilities;
>> +
>> +diff --git a/src/client.h b/src/client.h
>> +index 3a5f950..a10659b 100644
>> +--- a/src/client.h
>> ++++ b/src/client.h
>> +@@ -20,8 +20,8 @@
>> +  *
>> +  */
>> +
>> +-#include "platform/os.h"
>> +-#include "platform/threads/mutex.h"
>> ++#include "p8-platform/os.h"
>> ++#include "p8-platform/threads/mutex.h"
>> + #include "kodi/libXBMC_addon.h"
>> + #include "kodi/libXBMC_pvr.h"
>> + #include "kodi/libXBMC_codec.h"
>> +diff --git a/src/tvheadend/Subscription.cpp =
b/src/tvheadend/Subscription.cpp
>> +index 182ca7f..e18af1e 100644
>> +--- a/src/tvheadend/Subscription.cpp
>> ++++ b/src/tvheadend/Subscription.cpp
>> +@@ -23,7 +23,7 @@
>> + #include "utilities/Logger.h"
>> + #include "../Tvheadend.h"
>> +
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> + using namespace tvheadend;
>> + using namespace tvheadend::utilities;
>> +
>> +diff --git a/src/tvheadend/Subscription.h =
b/src/tvheadend/Subscription.h
>> +index b03bcce..363e5ef 100644
>> +--- a/src/tvheadend/Subscription.h
>> ++++ b/src/tvheadend/Subscription.h
>> +@@ -22,7 +22,7 @@
>> +  */
>> +
>> + #include <string>
>> +-#include "platform/threads/mutex.h"
>> ++#include "p8-platform/threads/mutex.h"
>> +
>> + extern "C"
>> + {
>> +@@ -146,6 +146,6 @@ namespace tvheadend
>> +     std::string       m_profile;
>> +     CHTSPConnection   &m_conn;
>> +
>> +-    mutable PLATFORM::CMutex  m_mutex;
>> ++    mutable P8PLATFORM::CMutex  m_mutex;
>> +   };
>> + }
>> +diff --git a/src/tvheadend/utilities/AsyncState.cpp =
b/src/tvheadend/utilities/AsyncState.cpp
>> +index 0c30a93..1f4fdf3 100644
>> +--- a/src/tvheadend/utilities/AsyncState.cpp
>> ++++ b/src/tvheadend/utilities/AsyncState.cpp
>> +@@ -22,7 +22,7 @@
>> + #include "AsyncState.h"
>> +
>> + using namespace tvheadend::utilities;
>> +-using namespace PLATFORM;
>> ++using namespace P8PLATFORM;
>> +
>> + struct Param {
>> +   eAsyncState state;
>> +@@ -37,7 +37,7 @@ AsyncState::AsyncState(int timeout)
>> +
>> + eAsyncState AsyncState::GetState()
>> + {
>> +-  PLATFORM::CLockObject lock(m_mutex);
>> ++  P8PLATFORM::CLockObject lock(m_mutex);
>> +   return m_state;
>> + }
>> +
>> +diff --git a/src/tvheadend/utilities/AsyncState.h =
b/src/tvheadend/utilities/AsyncState.h
>> +index 1d672da..0819cd8 100644
>> +--- a/src/tvheadend/utilities/AsyncState.h
>> ++++ b/src/tvheadend/utilities/AsyncState.h
>> +@@ -22,7 +22,7 @@
>> + #ifndef ASYNCSTATE_H
>> + #define	ASYNCSTATE_H
>> +
>> +-#include "platform/threads/mutex.h"
>> ++#include "p8-platform/threads/mutex.h"
>> +
>> + namespace tvheadend {
>> +   namespace utilities {
>> +@@ -75,8 +75,8 @@ namespace tvheadend {
>> +       static bool PredicateCallback ( void *param );
>> +
>> +       eAsyncState m_state;
>> +-      PLATFORM::CMutex m_mutex;
>> +-      PLATFORM::CCondition<bool> m_condition;
>> ++      P8PLATFORM::CMutex m_mutex;
>> ++      P8PLATFORM::CCondition<bool> m_condition;
>> +       int m_timeout;
>> +
>> +     };
>> +--
>> +2.0.1
>> +
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
>> new file mode 100644
>> index 0000000..1f33a8a
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
>> @@ -0,0 +1,55 @@
>> +SUMMARY =3D "Kodi Media Center PVR plugins"
>> +
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D =
"file://src/client.cpp;md5=3Dc8f6b73c5bc1048a3d6506700a7a91d2"
>> +
>> +DEPENDS =3D " \
>> +            zip-native \
>> +            p8platform \
>> +            kodi-platform \
>> +          "
>> +
>> +SRCREV_pvrhts =3D "7f75b70527922aef953123ff97ebaa22d9fb7cb4"
>> +
>> +SRCREV_FORMAT =3D "pvrhts"
>> +
>> +PV =3D "2.2.13+gitr${SRCPV}"
>> +SRC_URI =3D =
"git://github.com/kodi-pvr/pvr.hts.git;branch=3DJarvis;destsuffix=3Dpvr.ht=
s;name=3Dpvrhts \
>> +           file://0001-Update-to-p8-platform.patch \
>> +          "
>> +
>> +inherit cmake pkgconfig gettext
>> +
>> +S =3D "${WORKDIR}/pvr.hts"
>> +
>> +EXTRA_OECMAKE =3D " \
>> +	  -DADDONS_TO_BUILD=3Dpvr.hts \
>> +	  -DADDON_SRC_PREFIX=3D${WORKDIR}/git \
>> +	  -DCMAKE_BUILD_TYPE=3DDebug \
>> +	  -DCMAKE_INSTALL_PREFIX=3D${datadir}/kodi/addons \
>> +          -DCMAKE_MODULE_PATH=3D${STAGING_DIR_HOST}${libdir}/kodi \
>> +          -DCMAKE_PREFIX_PATH=3D${STAGING_DIR_HOST}${prefix} \
>> +          -DPACKAGE_ZIP=3D1 \
>> +        "
>> +
>> +do_compile_prepend() {
>> +	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' \
>> +	       -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g' =
\
>> +	          ${B}/CMakeFiles/*/flags.make
>> +	sed -i -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} =
-pipe:g'\
>> +	          ${B}/CMakeFiles/*/link.txt
>> +}
>> +
>> +# Make zip package for manual installation
>> +do_install_append() {
>> +	install -d ${D}${datadir}/kodi/addons/packages/
>> +	( cd ${D}${datadir}/kodi/addons
>> +	  zip -r ${D}${datadir}/kodi/addons/packages/pvr.hts-${PV}.zip =
pvr.hts -x '*.debug*' )
>> +}
>> +
>> +# Doesn't get added automagically, dlopen()?
>> +RDEPENDS_${PN} =3D "libkodiplatform"
>> +
>> +INSANE_SKIP_${PN} =3D "dev-so"
>> +FILES_${PN} +=3D "${datadir}/kodi"
>> +FILES_${PN}-dbg +=3D "${datadir}/kodi/addons/*/.debug/"
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-af=
ter-platform-rename.patch =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-af=
ter-platform-rename.patch
>> new file mode 100644
>> index 0000000..35e5134
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-Fix-build-af=
ter-platform-rename.patch
>> @@ -0,0 +1,67 @@
>> +=46rom 7cf366faa7a24c7146c745c8cd8dc3ae3d1cabea Mon Sep 17 00:00:00 =
2001
>> +From: Garrett Brown <themagnificentmrb@gmail.com>
>> +Date: Thu, 7 Jan 2016 15:55:22 -0800
>> +Subject: [PATCH] Fix build after platform rename
>> +
>> +update source code to use renamed platform pkg
>> +---
>> + CMakeLists.txt      | 6 +++---
>> + debian/control      | 2 +-
>> + src/util/XMLUtils.h | 2 +-
>> + 3 files changed, 5 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 2ce8c0d..bf6b659 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -8,7 +8,7 @@ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} =
${PROJECT_SOURCE_DIR})
>> + find_package(kodi REQUIRED)
>> + find_package(TinyXML REQUIRED)
>> + find_package(Threads REQUIRED)
>> +-find_package(platform REQUIRED)
>> ++find_package(p8-platform REQUIRED)
>> + include(UseMultiArch.cmake)
>> + include(CheckAtomic.cmake)
>> +
>> +@@ -36,10 +36,10 @@ endif()
>> +
>> + set(SOURCES src/util/XMLUtils.cpp)
>> +
>> +-include_directories(${TINYXML_INCLUDE_DIR} ${KODI_INCLUDE_DIR} =
${platform_INCLUDE_DIRS})
>> ++include_directories(${TINYXML_INCLUDE_DIR} ${KODI_INCLUDE_DIR} =
${p8-platform_INCLUDE_DIRS})
>> +
>> + add_library(kodiplatform ${SOURCES} ${PLAT_SOURCES})
>> +-target_link_libraries(kodiplatform ${kodiplatform_LIBRARIES} =
${platform_LIBRARIES})
>> ++target_link_libraries(kodiplatform ${kodiplatform_LIBRARIES} =
${p8-platform_LIBRARIES})
>> + set_target_properties(kodiplatform PROPERTIES VERSION =
${kodiplatform_VERSION_MAJOR}.${kodiplatform_VERSION_MINOR}.${kodiplatform=
_VERSION_PATCH}
>> +                                               SOVERSION =
${kodiplatform_VERSION_MAJOR}.0)
>> +
>> +diff --git a/debian/control b/debian/control
>> +index 42cadb2..e40c982 100644
>> +--- a/debian/control
>> ++++ b/debian/control
>> +@@ -1,7 +1,7 @@
>> + Source: kodiplatform
>> + Priority: extra
>> + Maintainer: Arne Morten Kvarving <arne.morten.kvarving@sintef.no>
>> +-Build-Depends: debhelper (>=3D 8.0.0), cmake, libtinyxml-dev, =
kodi-addon-dev, libplatform-dev
>> ++Build-Depends: debhelper (>=3D 8.0.0), cmake, libtinyxml-dev, =
kodi-addon-dev, libp8-platform-dev
>> + Standards-Version: 3.9.2
>> + Section: libs
>> +
>> +diff --git a/src/util/XMLUtils.h b/src/util/XMLUtils.h
>> +index f22fd07..a10d831 100644
>> +--- a/src/util/XMLUtils.h
>> ++++ b/src/util/XMLUtils.h
>> +@@ -21,7 +21,7 @@
>> +  *
>> +  */
>> +
>> +-#include <platform/util/StdString.h>
>> ++#include <p8-platform/util/StdString.h>
>> + #include "tinyxml.h"
>> +
>> + class XMLUtils
>> +--
>> +2.0.1
>> +
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-fix-cross-co=
mpile-badness.patch =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-fix-cross-co=
mpile-badness.patch
>> new file mode 100644
>> index 0000000..27e9d21
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/0001-fix-cross-co=
mpile-badness.patch
>> @@ -0,0 +1,40 @@
>> +=46rom 3136317f096ea7fda4fb907e775a01952c4aae3d Mon Sep 17 00:00:00 =
2001
>> +From: Stefan Saraev <stefan@saraev.ca>
>> +Date: Fri, 19 Feb 2016 10:33:00 +0100
>> +Subject: [PATCH] fix cross compile badness
>> +
>> +=46rom =
https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/mediacenter/k=
odi-platform/patches/kodi-platform-01_crosscompile-badness.patch
>> +---
>> + CMakeLists.txt               | 2 +-
>> + kodiplatform-config.cmake.in | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index bf6b659..9abe773 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -22,7 +22,7 @@ if(NOT WIN32)
>> +   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
>> + endif()
>> +
>> +-set(kodiplatform_INCLUDE_DIRS ${TINYXML_INCLUDE_DIR} =
"${CMAKE_INSTALL_PREFIX}/include/kodi")
>> ++set(kodiplatform_INCLUDE_DIRS ${TINYXML_INCLUDE_DIR} =
"${CMAKE_INSTALL_PREFIX_TOOLCHAIN}/include/kodi")
>> + IF(WIN32)
>> +   LIST(APPEND kodiplatform_INCLUDE_DIRS =
"${CMAKE_INSTALL_PREFIX}/include/kodi/windows")
>> + ENDIF(WIN32)
>> +diff --git a/kodiplatform-config.cmake.in =
b/kodiplatform-config.cmake.in
>> +index 3fc5273..60bdf1b 100644
>> +--- a/kodiplatform-config.cmake.in
>> ++++ b/kodiplatform-config.cmake.in
>> +@@ -10,7 +10,7 @@
>> + #
>> + # propagate these properties from one build system to the other
>> + set (kodiplatform_VERSION =
"@kodiplatform_VERSION_MAJOR@.@kodiplatform_VERSION_MINOR@")
>> +-set (kodiplatform_INCLUDE_DIRS @kodiplatform_INCLUDE_DIRS@ =
@CMAKE_INSTALL_PREFIX@/include)
>> ++set (kodiplatform_INCLUDE_DIRS @kodiplatform_INCLUDE_DIRS@ =
@CMAKE_INSTALL_PREFIX_TOOLCHAIN@/include)
>> + set (kodiplatform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
>> + set (kodiplatform_LINKER_FLAGS "@kodiplatform_LINKER_FLAGS@")
>> + set (kodiplatform_CONFIG_VARS "@kodiplatform_CONFIG_VARS@")
>> +--
>> +2.0.1
>> +
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/kodi-platform-02_=
no-multi-lib.patch =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/kodi-platform-02_=
no-multi-lib.patch
>> new file mode 100644
>> index 0000000..a13c53b
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform/kodi-platform-02_=
no-multi-lib.patch
>> @@ -0,0 +1,12 @@
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 9abe773..ae433fc 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -9,7 +9,6 @@ find_package(kodi REQUIRED)
>> + find_package(TinyXML REQUIRED)
>> + find_package(Threads REQUIRED)
>> + find_package(p8-platform REQUIRED)
>> +-include(UseMultiArch.cmake)
>> + include(CheckAtomic.cmake)
>> +
>> + set(kodiplatform_NAME kodiplatform)
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
>> new file mode 100644
>> index 0000000..5077454
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
>> @@ -0,0 +1,39 @@
>> +SUMMARY =3D "Platform support library used by libCEC and binary =
add-ons for Kodi"
>> +HOMEPAGE =3D "http://libcec.pulse-eight.com/"
>> +
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D =
"file://src/util/XMLUtils.cpp;beginline=3D2;endline=3D18;md5=3Ddae8e846500=
e70dd8ecee55f3f018c30"
>> +
>> +DEPENDS =3D "libtinyxml kodi"
>> +
>> +PV =3D "16.0.0"
>> +
>> +SRCREV =3D "15edaf78d6307eaa5e1d17028122d8bce9d55aa2"
>> +SRC_URI =3D "git://github.com/xbmc/kodi-platform.git \
>> +           file://0001-Fix-build-after-platform-rename.patch \
>> +           file://0001-fix-cross-compile-badness.patch \
>> +           file://kodi-platform-02_no-multi-lib.patch \
>> +          "
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit cmake pkgconfig
>> +
>> +EXTRA_OECMAKE =3D " =
-DCMAKE_INSTALL_PREFIX_TOOLCHAIN=3D${STAGING_DIR_TARGET} \
>> +                  -DCMAKE_INSTALL_LIBDIR=3D${libdir} \
>> +                  -DCMAKE_INSTALL_LIBDIR_NOARCH=3D${libdir} \
>> +                  -DKODI_INCLUDE_DIR=3D${STAGING_LIBDIR}/kodi \
>> +                  -DKODI_INCLUDE_DIR=3D${STAGING_INCDIR}/kodi \
>> +                "
>> +
>> +do_compile_prepend() {
>> +	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' \
>> +	       -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g' =
\
>> +	          ${B}/CMakeFiles/kodiplatform.dir/flags.make
>> +	sed -i -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} =
-pipe:g'\
>> +	          ${B}/CMakeFiles/kodiplatform.dir/link.txt
>> +}
>> +
>> +RPROVIDES_${PN} +=3D "libkodiplatform"
>> +FILES_${PN}-dev +=3D "${libdir}/*platform"
>> +
>> diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
>> new file mode 100644
>> index 0000000..955d02b
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
>> @@ -0,0 +1,20 @@
>> +SUMMARY =3D "Systemd service for kodi startup"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d690"
>> +
>> +PV =3D "1.0"
>> +
>> +SRC_URI =3D "file://kodi.service"
>> +
>> +inherit systemd
>> +
>> +do_install() {
>> +	install -d ${D}/lib/systemd/system
>> +	install -m 0644 ${WORKDIR}/kodi.service ${D}/lib/systemd/system/
>> +}
>> +
>> +SYSTEMD_PACKAGES =3D "${PN}"
>> +SYSTEMD_SERVICE_${PN} =3D "kodi.service"
>> +
>> +RDEPENDS_${PN} +=3D "xinit kodi"
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
>> new file mode 100644
>> index 0000000..29d0394
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
>> @@ -0,0 +1,14 @@
>> +[Unit]
>> +Description=3DKodi media thing
>> +
>> +[Service]
>> +User=3Droot
>> +Type=3Dsimple
>> +SuccessExitStatus=3D0 1
>> +IOSchedulingClass=3Drealtime
>> +IOSchedulingPriority=3D0
>> +
>> +ExecStart=3D/usr/bin/xinit /usr/bin/kodi-standalone -- /usr/bin/X :0
>> +
>> +[Install]
>> +WantedBy=3Dbasic.target
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi/0001-configure-don-t-try-t=
o-run-stuff-to-find-tinyxml.patch =
b/meta-multimedia/recipes-mediacenter/kodi/kodi/0001-configure-don-t-try-t=
o-run-stuff-to-find-tinyxml.patch
>> new file mode 100644
>> index 0000000..b3780db
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi/0001-configure-don-t-try-t=
o-run-stuff-to-find-tinyxml.patch
>> @@ -0,0 +1,25 @@
>> +=46rom 53c7b1667a41b25775d1dc009d8ced61f383da0b Mon Sep 17 00:00:00 =
2001
>> +From: Koen Kooi <koen@dominion.thruhere.net>
>> +Date: Sat, 6 Feb 2016 15:43:01 +0100
>> +Subject: [PATCH 1/3] configure: don't try to run stuff to find =
tinyxml
>> +
>> +---
>> + configure.ac | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index 5a41fb4..243c7e5 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -1043,7 +1043,7 @@ fi
>> + AC_LANG_PUSH([C++])
>> + PKG_CHECK_MODULES([TINYXML], [tinyxml >=3D 2.6.2],
>> +   [INCLUDES=3D"$INCLUDES $TINYXML_CFLAGS"; LIBS=3D"$LIBS =
$TINYXML_LIBS"],
>> +-  [AC_RUN_IFELSE(
>> ++  [AC_COMPILE_IFELSE(
>> +    [AC_LANG_SOURCE([[
>> + #include <stdlib.h>
>> + #include <tinyxml.h>
>> +--
>> +2.10.1
>> +
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi/0002-handle-SIGTERM.patch =
b/meta-multimedia/recipes-mediacenter/kodi/kodi/0002-handle-SIGTERM.patch
>> new file mode 100644
>> index 0000000..b2af5de
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi/0002-handle-SIGTERM.patch
>> @@ -0,0 +1,163 @@
>> +=46rom 1c1484303a055bfde655ffae3829554aaefc2e07 Mon Sep 17 00:00:00 =
2001
>> +From: Stefan Saraev <stefan@saraev.ca>
>> +Date: Wed, 2 Nov 2016 11:28:34 -0700
>> +Subject: [PATCH 2/3] handle SIGTERM
>> +
>> +0. CApplication::Stop cant be trusted. (deadlocks crashes and boo)
>> +
>> +so, when shutdown/reboot is requested:
>> +
>> +1. save an exit code (for CEC...)
>> +2. call CPowerManager::{Reboot,PowerDown}
>> +3. ... then systemd sends TERM and waits xx seconds before sending =
KILL
>> +4. CApplication::Stop has xx seconds to save guisettings.xml and boo
>> +5. CEC thread has xx seconds to switch off after it received OnQuit
>> +6. addons / pvrmanager / cec / everything else.. are free to =
deadlock / crash now, we dont care
>> +7. KILL
>> +
>> +Signed-off-by: Stefan Saraev <stefan@saraev.ca>
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + xbmc/Application.cpp         | 17 ++++++++++++-----
>> + xbmc/Application.h           |  1 +
>> + xbmc/XBApplicationEx.cpp     |  1 +
>> + xbmc/XBApplicationEx.h       |  1 +
>> + xbmc/platform/posix/main.cpp | 15 +++++++++++++++
>> + 5 files changed, 30 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/xbmc/Application.cpp b/xbmc/Application.cpp
>> +index 4c118e0..58b151a 100644
>> +--- a/xbmc/Application.cpp
>> ++++ b/xbmc/Application.cpp
>> +@@ -2428,12 +2428,12 @@ void =
CApplication::OnApplicationMessage(ThreadMessage* pMsg)
>> +   switch (pMsg->dwMessage)
>> +   {
>> +   case TMSG_POWERDOWN:
>> +-    Stop(EXITCODE_POWERDOWN);
>> ++    SetExitCode(EXITCODE_POWERDOWN);
>> +     g_powerManager.Powerdown();
>> +     break;
>> +
>> +   case TMSG_QUIT:
>> +-    Stop(EXITCODE_QUIT);
>> ++    SetExitCode(EXITCODE_QUIT);
>> +     break;
>> +
>> +   case TMSG_SHUTDOWN:
>> +@@ -2454,12 +2454,13 @@ void =
CApplication::OnApplicationMessage(ThreadMessage* pMsg)
>> +
>> +   case TMSG_RESTART:
>> +   case TMSG_RESET:
>> +-    Stop(EXITCODE_REBOOT);
>> ++    SetExitCode(EXITCODE_REBOOT);
>> +     g_powerManager.Reboot();
>> +     break;
>> +
>> +   case TMSG_RESTARTAPP:
>> + #if defined(TARGET_WINDOWS) || defined(TARGET_LINUX)
>> ++    SetExitCode(EXITCODE_RESTARTAPP);
>> +     Stop(EXITCODE_RESTARTAPP);
>> + #endif
>> +     break;
>> +@@ -2883,6 +2884,13 @@ bool CApplication::Cleanup()
>> +   }
>> + }
>> +
>> ++void CApplication::SetExitCode(int exitCode)
>> ++{
>> ++  // save it for CEC
>> ++  m_ExitCode =3D exitCode;
>> ++  m_ExitCodeSet =3D true;
>> ++}
>> ++
>> + void CApplication::Stop(int exitCode)
>> + {
>> +   try
>> +@@ -2890,7 +2898,7 @@ void CApplication::Stop(int exitCode)
>> +     m_frameMoveGuard.unlock();
>> +
>> +     CVariant vExitCode(CVariant::VariantTypeObject);
>> +-    vExitCode["exitcode"] =3D exitCode;
>> ++    vExitCode["exitcode"] =3D m_ExitCode;
>> +     CAnnouncementManager::GetInstance().Announce(System, "xbmc", =
"OnQuit", vExitCode);
>> +
>> +     // Abort any active screensaver
>> +@@ -2924,7 +2932,6 @@ void CApplication::Stop(int exitCode)
>> +
>> +     m_bStop =3D true;
>> +     m_AppFocused =3D false;
>> +-    m_ExitCode =3D exitCode;
>> +     CLog::Log(LOGNOTICE, "stop all");
>> +
>> +     // cancel any jobs from the jobmanager
>> +diff --git a/xbmc/Application.h b/xbmc/Application.h
>> +index 22aca81..9992677 100644
>> +--- a/xbmc/Application.h
>> ++++ b/xbmc/Application.h
>> +@@ -160,6 +160,7 @@ public:
>> +   void StopPVRManager();
>> +   void ReinitPVRManager();
>> +   bool IsCurrentThread() const;
>> ++  void SetExitCode(int exitCode);
>> +   void Stop(int exitCode);
>> +   void RestartApp();
>> +   void UnloadSkin(bool forReload =3D false);
>> +diff --git a/xbmc/XBApplicationEx.cpp b/xbmc/XBApplicationEx.cpp
>> +index 035aed2..34102f5 100644
>> +--- a/xbmc/XBApplicationEx.cpp
>> ++++ b/xbmc/XBApplicationEx.cpp
>> +@@ -46,6 +46,7 @@ CXBApplicationEx::CXBApplicationEx()
>> +   m_bStop =3D false;
>> +   m_AppFocused =3D true;
>> +   m_ExitCode =3D EXITCODE_QUIT;
>> ++  m_ExitCodeSet =3D false;
>> +   m_renderGUI =3D false;
>> + }
>> +
>> +diff --git a/xbmc/XBApplicationEx.h b/xbmc/XBApplicationEx.h
>> +index 9bc14fa..f696b89 100644
>> +--- a/xbmc/XBApplicationEx.h
>> ++++ b/xbmc/XBApplicationEx.h
>> +@@ -42,6 +42,7 @@ public:
>> +   // Variables for timing
>> +   bool m_bStop;
>> +   int  m_ExitCode;
>> ++  bool m_ExitCodeSet;
>> +   bool m_AppFocused;
>> +   bool m_renderGUI;
>> +
>> +diff --git a/xbmc/platform/posix/main.cpp =
b/xbmc/platform/posix/main.cpp
>> +index a8b64e5..3d80032 100644
>> +--- a/xbmc/platform/posix/main.cpp
>> ++++ b/xbmc/platform/posix/main.cpp
>> +@@ -41,12 +41,27 @@
>> + #include "input/linux/LIRC.h"
>> + #endif
>> + #include "platform/XbmcContext.h"
>> ++#include "Application.h"
>> ++
>> ++void xbmc_term_handler(int signum)
>> ++{
>> ++  CLog::Log(LOGINFO, "Received SIGTERM...");
>> ++  if (!g_application.m_ExitCodeSet)
>> ++    g_application.SetExitCode(EXITCODE_RESTARTAPP);
>> ++  g_application.Stop(EXITCODE_RESTARTAPP);
>> ++}
>> +
>> + #ifdef __cplusplus
>> + extern "C"
>> + #endif
>> + int main(int argc, char* argv[])
>> + {
>> ++  // SIGTERM handler
>> ++  struct sigaction action;
>> ++  memset(&action, 0, sizeof(struct sigaction));
>> ++  action.sa_handler =3D xbmc_term_handler;
>> ++  sigaction(SIGTERM, &action, NULL);
>> ++
>> +   // set up some xbmc specific relationships
>> +   XBMC::Context context;
>> +
>> +--
>> +2.10.1
>> +
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi/0003-add-support-to-read-f=
requency-output-if-using-intel-.patch =
b/meta-multimedia/recipes-mediacenter/kodi/kodi/0003-add-support-to-read-f=
requency-output-if-using-intel-.patch
>> new file mode 100644
>> index 0000000..d638550
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi/0003-add-support-to-read-f=
requency-output-if-using-intel-.patch
>> @@ -0,0 +1,26 @@
>> +=46rom 4ef1e9dab9193f1a5305d25c8eda97f8f06ea154 Mon Sep 17 00:00:00 =
2001
>> +From: Stephan Raue <stephan@openelec.tv>
>> +Date: Mon, 1 Sep 2014 03:16:37 +0200
>> +Subject: [PATCH 3/3] add support to read frequency output if using =
intel's
>> + pstate driver
>> +
>> +---
>> + xbmc/utils/CPUInfo.cpp | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/xbmc/utils/CPUInfo.cpp b/xbmc/utils/CPUInfo.cpp
>> +index 5e2ebbd..fd04d5a 100644
>> +--- a/xbmc/utils/CPUInfo.cpp
>> ++++ b/xbmc/utils/CPUInfo.cpp
>> +@@ -274,6 +274,8 @@ CCPUInfo::CCPUInfo(void)
>> +     m_fProcTemperature =3D =
fopen("/sys/class/thermal/thermal_zone0/temp", "r");  // On Raspberry =
PIs
>> +
>> +   m_fCPUFreq =3D fopen =
("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", "r");
>> ++  if (m_fCPUFreq =3D=3D NULL)
>> ++    m_fCPUFreq =3D fopen =
("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq", "r");
>> +   if (!m_fCPUFreq)
>> +   {
>> +     m_cpuInfoForFreq =3D true;
>> +--
>> +2.10.1
>> +
>> diff --git =
a/meta-multimedia/recipes-mediacenter/kodi/kodi/0004-Disable-DVD-support.p=
atch =
b/meta-multimedia/recipes-mediacenter/kodi/kodi/0004-Disable-DVD-support.p=
atch
>> new file mode 100644
>> index 0000000..6f5f9a2
>> --- /dev/null
>> +++ =
b/meta-multimedia/recipes-mediacenter/kodi/kodi/0004-Disable-DVD-support.p=
atch
>> @@ -0,0 +1,35 @@
>> +=46rom 191cf3f084b4d34846711034a7fe3078f8243c82 Mon Sep 17 00:00:00 =
2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Wed, 2 Nov 2016 12:39:20 -0700
>> +Subject: [PATCH 4/4] Disable DVD support
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + Makefile.in | 4 +---
>> + 1 file changed, 1 insertion(+), 3 deletions(-)
>> +
>> +diff --git a/Makefile.in b/Makefile.in
>> +index 58b3a17..b7c3fce 100644
>> +--- a/Makefile.in
>> ++++ b/Makefile.in
>> +@@ -10,8 +10,7 @@ EC_DIRS=3D \
>> + 	tools/EventClients
>> +
>> + DVDPCODECS_DIRS=3D \
>> +-	lib \
>> +-	lib/libdvd
>> ++	lib
>> +
>> + VideoPlayer_ARCHIVES=3Dxbmc/cores/VideoPlayer/VideoPlayer.a \
>> +                    xbmc/cores/VideoPlayer/DVDCodecs/DVDCodecs.a \
>> +@@ -343,7 +342,6 @@ libaddon: exports
>> + 	$(MAKE) -C lib/addons/library.xbmc.pvr
>> + 	$(MAKE) -C lib/addons/library.kodi.inputstream
>> + dvdpcodecs: dllloader
>> +-	$(MAKE) -C lib/libdvd
>> +
>> + dvdpextcodecs:
>> +
>> +--
>> +2.10.1
>> +
>> diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb =
b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
>> new file mode 100644
>> index 0000000..807871f
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
>> @@ -0,0 +1,177 @@
>> +SUMMARY =3D "Kodi Media Center"
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.GPL;md5=3D930e2a5f63425d8dd72dbd7391c43c46"
>> +
>> +DEPENDS =3D " \
>> +            cmake-native \
>> +            curl-native \
>> +            gperf-native \
>> +            jsonschemabuilder-native \
>> +            nasm-native \
>> +            swig-native \
>> +            yasm-native \
>> +            zip-native \
>> +            avahi \
>> +            boost \
>> +            bzip2 \
>> +            curl \
>> +            dcadec \
>> +            enca \
>> +            expat \
>> +            faad2 \
>> +            ffmpeg \
>> +            fontconfig \
>> +            fribidi \
>> +            giflib \
>> +            jasper \
>> +            libass \
>> +            libcdio \
>> +            libcec \
>> +            libmad \
>> +            libmicrohttpd \
>> +            libmms \
>> +            libmms \
>> +            libmodplug \
>> +            libpcre \
>> +            libplist \
>> +            libsamplerate0 \
>> +            libsdl-image \
>> +            libsdl-mixer \
>> +            libsquish \
>> +            libssh \
>> +            libtinyxml \
>> +            libusb1 \
>> +            libxslt \
>> +            lzo \
>> +            mpeg2dec \
>> +            python \
>> +            samba \
>> +            sqlite3 \
>> +            taglib \
>> +            virtual/egl \
>> +            virtual/libsdl \
>> +            wavpack \
>> +            yajl \
>> +            zlib \
>> +            ${@enable_glew(bb, d)} \
>> +          "
>> +
>> +PROVIDES =3D "xbmc"
>> +
>> +SRCREV =3D "32c7788e7cce711be5b7f3893c82dddd79658268"
>> +PV =3D "17.0+gitr${SRCPV}"
>> +SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3Dmaster \
>> +           =
file://0001-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
>> +           file://0002-handle-SIGTERM.patch \
>> +           =
file://0003-add-support-to-read-frequency-output-if-using-intel-.patch \
>> +           file://0004-Disable-DVD-support.patch \
>> +"
>> +
>> +inherit autotools-brokensep gettext pythonnative
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +# breaks compilation
>> +ASNEEDED =3D ""
>> +
>> +ACCEL ?=3D ""
>> +ACCEL_x86 =3D "vaapi vdpau"
>> +ACCEL_x86-64 =3D "vaapi vdpau"
>> +
>> +PACKAGECONFIG ??=3D "${ACCEL}"
>> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'x11', ' x11', '', d)}"
>> +PACKAGECONFIG_append +=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'opengl', ' opengl', ' openglesv2', d)}"
>> +
>> +PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,"
>> +PACKAGECONFIG[openglesv2] =3D =
"--enable-gles,--enable-gl,virtual/egl"
>> +PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
>> +PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpau,libvdpau"
>> +PACKAGECONFIG[mysql] =3D "--enable-mysql,--disable-mysql,mysql5"
>> +PACKAGECONFIG[x11] =3D "--enable-x11,--disable-x11,libxinerama =
libxmu libxrandr libxtst"
>> +PACKAGECONFIG[pulseaudio] =3D =
"--enable-pulse,--disable-pulse,pulseaudio"
>> +
>> +EXTRA_OECONF_append_rpi =3D " --enable-openmax =
--enable-player=3Domxplayer --with-platform=3Draspberry-pi2"
>> +#LDFLAGS_append_rpi =3D " -lEGL -lGLESv2 -lbcm_host -lvcos =
-lvchiq_arm -lvchostif -lmmal -lmmal_core -lmmal_util "
>> +LDFLAGS_append_rpi =3D " -lvchostif "
>> +EXTRA_OECONF =3D " \
>> +    --disable-debug \
>> +    --disable-libcap \
>> +    --disable-ccache \
>> +    --disable-mid \
>> +    --enable-libusb \
>> +    --enable-airplay \
>> +    --disable-optical-drive \
>> +    --with-ffmpeg=3Dshared \
>> +    --enable-texturepacker=3Dno \
>> +"
>> +
>> +FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations =
-fomit-frame-pointer -O4 -ffast-math"
>> +FULL_OPTIMIZATION_armv7ve =3D "-fexpensive-optimizations =
-fomit-frame-pointer -O4 -ffast-math"
>> +BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
>> +
>> +# for python modules
>> +export HOST_SYS
>> +export BUILD_SYS
>> +export STAGING_LIBDIR
>> +export STAGING_INCDIR
>> +export PYTHON_DIR
>> +
>> +def enable_glew(bb, d):
>> +    if bb.utils.contains('PACKAGECONFIG', 'x11', True, False, d) and =
bb.utils.contains('DISTRO_FEATURES', 'opengl', True, False, d):
>> +        return "glew"
>> +    return ""
>> +
>> +do_configure() {
>> +    ( for i in $(find ${S} -name "configure.*" ) ; do
>> +       cd $(dirname $i) && gnu-configize --force || true
>> +    done )
>> +    make -C tools/depends/target/crossguid =
PREFIX=3D${STAGING_DIR_HOST}${prefix}
>> +
>> +    BOOTSTRAP_STANDALONE=3D1 make -f bootstrap.mk =
JSON_BUILDER=3D"${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
>> +    BOOTSTRAP_STANDALONE=3D1 make -f codegenerator.mk =
JSON_BUILDER=3D"${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
>> +    oe_runconf
>> +}
>> +
>> +do_compile_prepend() {
>> +    for i in $(find . -name "Makefile") ; do
>> +        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
>> +    done
>> +
>> +    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
>> +        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e =
's:-rpath \$(libdir):-rpath ${libdir}:g' $i
>> +    done
>> +}
>> +
>> +INSANE_SKIP_${PN} =3D "rpaths"
>> +
>> +FILES_${PN} +=3D "${datadir}/xsessions ${datadir}/icons =
${libdir}/xbmc ${datadir}/xbmc"
>> +FILES_${PN}-dbg +=3D "${libdir}/kodi/.debug ${libdir}/kodi/*/.debug =
${libdir}/kodi/*/*/.debug ${libdir}/kodi/*/*/*/.debug"
>> +
>> +# kodi uses some kind of dlopen() method for libcec so we need to =
add it manually
>> +# OpenGL builds need glxinfo, that's in mesa-demos
>> +RRECOMMENDS_${PN}_append =3D " libcec \
>> +                             python \
>> +                             python-lang \
>> +                             python-re \
>> +                             python-netclient \
>> +                             python-html \
>> +                             python-difflib \
>> +                             python-json \
>> +                             python-zlib \
>> +                             python-shell \
>> +                             python-sqlite3 \
>> +                             python-compression \
>> +                             libcurl \
>> +                             ${@bb.utils.contains('PACKAGECONFIG', =
'x11', 'xrandr xdpyinfo', '', d)} \
>> +"
>> +RRECOMMENDS_${PN}_append_libc-glibc =3D " glibc-charmap-ibm850 \
>> +                                        glibc-gconv-ibm850 \
>> +					glibc-gconv-unicode \
>> +                                        glibc-gconv-utf-32 \
>> +					glibc-charmap-utf-8 \
>> +					glibc-localedata-en-us \
>> +                                      "
>> +
>> +RPROVIDES_${PN} +=3D "xbmc"
>> +
>> diff --git =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-p=
ython-distutils-to-find-STAGING.patch =
b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-p=
ython-distutils-to-find-STAGING.patch
>> deleted file mode 100644
>> index dfc3959..0000000
>> --- =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0001-configure-don-t-run-p=
ython-distutils-to-find-STAGING.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -=46rom 0dce5a2abd9f42876616c35772a4d71c5399543c Mon Sep 17 00:00:00 =
2001
>> -From: Koen Kooi <koen@dominion.thruhere.net>
>> -Date: Sat, 17 Dec 2011 11:38:15 +0100
>> -Subject: [PATCH 1/4] configure: don't run python distutils to find =
STAGING_INCDIR/python, it is not safe for per-machine sysroots
>> -
>> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ----
>> - m4/ax_python_devel.m4 |    7 +------
>> - 1 files changed, 1 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
>> -index adbd207..dee70f6 100644
>> ---- a/m4/ax_python_devel.m4
>> -+++ b/m4/ax_python_devel.m4
>> -@@ -151,12 +151,7 @@ $ac_distutils_result])
>> - 	#
>> - 	AC_MSG_CHECKING([for Python include path])
>> - 	if test -z "$PYTHON_CPPFLAGS"; then
>> --		python_path=3D`$PYTHON -c "import distutils.sysconfig; \
>> --			print (distutils.sysconfig.get_python_inc ());"`
>> --		if test -n "${python_path}"; then
>> --			python_path=3D"-I$python_path"
>> --		fi
>> --		PYTHON_CPPFLAGS=3D$python_path
>> -+		PYTHON_CPPFLAGS=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"
>> - 	fi
>> - 	AC_MSG_RESULT([$PYTHON_CPPFLAGS])
>> - 	AC_SUBST([PYTHON_CPPFLAGS])
>> ---
>> -1.7.2.5
>> -
>> diff --git =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-=
memory-barriers-to-atomic-Add-S.patch =
b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-=
memory-barriers-to-atomic-Add-S.patch
>> deleted file mode 100644
>> index e0a4037..0000000
>> --- =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0002-Revert-fixed-ios-Add-=
memory-barriers-to-atomic-Add-S.patch
>> +++ /dev/null
>> @@ -1,97 +0,0 @@
>> -=46rom 7b2a8a7869d257cba35f53f6d877877c29cdac27 Mon Sep 17 00:00:00 =
2001
>> -From: Paul Menzel <paulepanter@users.sourceforge.net>
>> -Date: Sun, 14 Aug 2011 21:53:47 +0200
>> -Subject: [PATCH 2/4] Revert "fixed:[ios] Add memory barriers to =
atomic Add/Subtract and Increment/Decrement functions to ensure =
synchronized accesses."
>> -
>> -This reverts commit 9a10c48710df79118e39e9b3bb0a15bf1fe694d1.
>> -
>> -The build (OpenEmbedded `angstrom-2010.x` for `MACHINE =3D =
"beagleboard") fails with the following error.
>> -
>> -        make -C xbmc/threads
>> -        make[1]: Entering directory =
`/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/x=
bmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/thre=
ads'
>> -        CPP     Atomics.o
>> -        /tmp/ccIzTm3L.s: Assembler messages:
>> -        /tmp/ccIzTm3L.s:40: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:48: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:76: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:83: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:111: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:118: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:145: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:152: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:180: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccIzTm3L.s:187: Error: garbage following instruction -- =
`dmb ish'
>> -        make[1]: *** [Atomics.o] Error 1
>> -        make[1]: Leaving directory =
`/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/x=
bmc-10.05-r11+gitr0+9a10c48710df79118e39e9b3bb0a15bf1fe694d1/git/xbmc/thre=
ads'
>> -        make: *** [xbmc/threads/threads.a] Error 2
>> ----
>> - xbmc/threads/Atomics.cpp |    8 --------
>> - 1 files changed, 0 insertions(+), 8 deletions(-)
>> -
>> -diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
>> -index 5b09f18..0a98a7e 100644
>> ---- a/xbmc/threads/Atomics.cpp
>> -+++ b/xbmc/threads/Atomics.cpp
>> -@@ -194,14 +194,12 @@ long AtomicIncrement(volatile long* pAddr)
>> - {
>> -   register long val;
>> -   asm volatile (
>> --                "dmb      ish            \n" // Memory barrier. =
Make sure all memory accesses appearing before this complete before any =
that appear after
>> -                 "1:                     \n"
>> -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
>> -                 "add     %0,  #1        \n" // (val +=3D 1)
>> -                 "strex   r1,  %0, [%1]	\n"
>> -                 "cmp     r1,   #0       \n"
>> -                 "bne     1b             \n"
>> --                "dmb     ish            \n" // Memory barrier.
>> -                 : "=3D&r" (val)
>> -                 : "r"(pAddr)
>> -                 : "r1"
>> -@@ -273,14 +271,12 @@ long AtomicAdd(volatile long* pAddr, long =
amount)
>> - {
>> -   register long val;
>> -   asm volatile (
>> --                "dmb      ish            \n" // Memory barrier. =
Make sure all memory accesses appearing before this complete before any =
that appear after
>> -                 "1:                     \n"
>> -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
>> -                 "add     %0,  %2        \n" // (val +=3D amount)
>> -                 "strex   r1,  %0, [%1]	\n"
>> -                 "cmp     r1,   #0       \n"
>> -                 "bne     1b             \n"
>> --                "dmb     ish            \n" // Memory barrier.
>> -                 : "=3D&r" (val)
>> -                 : "r"(pAddr), "r"(amount)
>> -                 : "r1"
>> -@@ -351,14 +347,12 @@ long AtomicDecrement(volatile long* pAddr)
>> - {
>> -   register long val;
>> -   asm volatile (
>> --                "dmb      ish            \n" // Memory barrier. =
Make sure all memory accesses appearing before this complete before any =
that appear after
>> -                 "1:                     \n"
>> -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
>> -                 "sub     %0,  #1        \n" // (val -=3D 1)
>> -                 "strex   r1,  %0, [%1]	\n"
>> -                 "cmp     r1,   #0       \n"
>> -                 "bne     1b             \n"
>> --                "dmb     ish            \n" // Memory barrier.
>> -                 : "=3D&r" (val)
>> -                 : "r"(pAddr)
>> -                 : "r1"
>> -@@ -431,14 +425,12 @@ long AtomicSubtract(volatile long* pAddr, long =
amount)
>> - {
>> -   register long val;
>> -   asm volatile (
>> --                "dmb     ish            \n" // Memory barrier. Make =
sure all memory accesses appearing before this complete before any that =
appear after
>> -                 "1:                     \n"
>> -                 "ldrex   %0, [%1]       \n" // (val =3D *pAddr)
>> -                 "sub     %0,  %2        \n" // (val -=3D amount)
>> -                 "strex   r1,  %0, [%1]	\n"
>> -                 "cmp     r1,   #0       \n"
>> -                 "bne     1b             \n"
>> --                "dmb     ish            \n" // Memory barrier.
>> -                 : "=3D&r" (val)
>> -                 : "r"(pAddr), "r"(amount)
>> -                 : "r1"
>> ---
>> -1.7.2.5
>> -
>> diff --git =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-=
memory-barriers-to-cas-assembly.patch =
b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-=
memory-barriers-to-cas-assembly.patch
>> deleted file mode 100644
>> index 629017b..0000000
>> --- =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0003-Revert-fixed-ios-Add-=
memory-barriers-to-cas-assembly.patch
>> +++ /dev/null
>> @@ -1,69 +0,0 @@
>> -=46rom aaae1616a09d359b52e929f944ca0ceb4bb7f831 Mon Sep 17 00:00:00 =
2001
>> -From: Paul Menzel <paulepanter@users.sourceforge.net>
>> -Date: Sun, 14 Aug 2011 21:55:09 +0200
>> -Subject: [PATCH 3/4] Revert "fixed:[ios] Add memory barriers to =
cas() assembly to ensure alignment of memory accesses."
>> -
>> -This reverts commit 92bab651e2253d172879995b50985645b77fecd2.
>> -
>> -The build (OpenEmbedded `angstrom-2010.x` for `MACHINE =3D =
"beagleboard") fails with the following error.
>> -
>> -        CPP     Atomics.o
>> -        make[1]: Entering directory =
`/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/x=
bmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/wind=
ows'
>> -        CPP     GUIMediaWindow.o
>> -        /tmp/ccrsywuV.s: Assembler messages:
>> -        /tmp/ccrsywuV.s:40: Error: garbage following instruction -- =
`dmb ish'
>> -        /tmp/ccrsywuV.s:48: Error: garbage following instruction -- =
`dmb ish'
>> -        make[1]: *** [Atomics.o] Error 1
>> -        make[1]: Leaving directory =
`/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/x=
bmc-10.05-r11+gitr0+92bab651e2253d172879995b50985645b77fecd2/git/xbmc/thre=
ads'
>> -        make: *** [xbmc/threads/threads.a] Error 2
>> ----
>> - xbmc/threads/Atomics.cpp |   33 ++++++++++++++++-----------------
>> - 1 files changed, 16 insertions(+), 17 deletions(-)
>> -
>> -diff --git a/xbmc/threads/Atomics.cpp b/xbmc/threads/Atomics.cpp
>> -index 0a98a7e..0967eb2 100644
>> ---- a/xbmc/threads/Atomics.cpp
>> -+++ b/xbmc/threads/Atomics.cpp
>> -@@ -49,23 +49,22 @@ long cas(volatile long *pAddr, long expectedVal, =
long swapVal)
>> - #elif defined(__arm__)
>> - long cas(volatile long* pAddr, long expectedVal, long swapVal)
>> - {
>> --  register long prev;
>> --  asm volatile (
>> --                "dmb      ish            \n" // Memory barrier. =
Make sure all memory accesses appearing before this complete before any =
that appear after
>> --                "1:                      \n"
>> --                "ldrex    %0, [%1]       \n" // Load the current =
value of *pAddr(%1) into prev (%0) and lock pAddr,
>> --                "cmp      %0,  %2        \n" // Verify that the =
current value (%0) =3D=3D old value (%2)
>> --                "bne      2f             \n" // Bail if the two =
values are not equal [not as expected]
>> --                "strex    r1,  %3, [%1]  \n"
>> --                "cmp      r1,  #0        \n"
>> --                "bne      1b             \n"
>> --                "dmb      ish            \n" // Memory barrier.
>> --                "2:                      \n"
>> --                : "=3D&r" (prev)
>> --                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
>> --                : "r1"
>> --                );
>> --  return prev;
>> -+  return(__sync_val_compare_and_swap(pAddr, expectedVal, swapVal));
>> -+//  register long prev;
>> -+//  asm volatile (
>> -+//                "1:                      \n"
>> -+//                "ldrex    %0, [%1]       \n" /* Load the current =
value of *pAddr(%1) into prev (%0) and lock pAddr,  */
>> -+//                "cmp      %0,  %2        \n" /* Verify that the =
current value (%0) =3D=3D old value (%2) */
>> -+//                "bne      2f             \n" /* Bail if the two =
values are not equal [not as expected] */
>> -+//                "strex    r1,  %3, [%1]  \n"
>> -+//                "cmp      r1,  #0        \n"
>> -+//                "bne      1b             \n"
>> -+//                "2:                        "
>> -+//                : "=3D&r" (prev)
>> -+//                : "r"(pAddr), "r"(expectedVal),"r"(swapVal)
>> -+//                : "r1"
>> -+//                );
>> -+//  return prev;
>> - }
>> -
>> - #elif defined(__mips__)
>> ---
>> -1.7.2.5
>> -
>> diff --git =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-l=
d-is-gold-DISTRO_FEATURE.patch =
b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-l=
d-is-gold-DISTRO_FEATURE.patch
>> deleted file mode 100644
>> index 345e20e..0000000
>> --- =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/0004-configure-cope-with-l=
d-is-gold-DISTRO_FEATURE.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -=46rom fd8f73826240aae543a41a2bfeea0056e2fe594d Mon Sep 17 00:00:00 =
2001
>> -From: Koen Kooi <koen@dominion.thruhere.net>
>> -Date: Mon, 11 Mar 2013 11:04:29 +0100
>> -Subject: [PATCH] configure: cope with ld-is-gold DISTRO_FEATURE
>> -
>> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ----
>> -
>> -Upstream-Stature: backport
>> -
>> - configure.in |   12 +++++++-----
>> - 1 files changed, 7 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/configure.in b/configure.in
>> -index ef94683..c8b459b 100755
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -18,9 +18,14 @@ tolower(){
>> - # check for library basenames
>> - AC_DEFUN([XB_FIND_SONAME],
>> - [
>> -+  #set -x
>> -   if [[ "$host_vendor" !=3D "apple" ]]; then
>> -     AC_MSG_CHECKING([for lib$2 soname])
>> -     $1_FILENAME=3D$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-M =
2>/dev/null | grep "^LOAD.*$2" | awk '{V=3D2; print $V}')
>> -+    if [[ -z $$1_FILENAME ]]; then
>> -+      #try gold linker syntax
>> -+      $1_FILENAME=3D$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 =
-Wl,-t 3>&1 1>&2 2>&3 | grep "$2")
>> -+    fi
>> -     if [[ ! -z $$1_FILENAME ]]; then
>> -       $1_SONAME=3D$(objdump -p $$1_FILENAME | grep "SONAME.*$2" | =
awk '{V=3D2; print $V}')
>> -     fi
>> -@@ -55,6 +60,7 @@ AC_DEFUN([XB_FIND_SONAME],
>> -     AC_MSG_RESULT([$$1_SONAME])
>> -     AC_SUBST($1_SONAME)
>> -   fi
>> -+  #set +x
>> - ])
>> -
>> - # Function to push and pop libs and includes for a command
>> ---
>> -1.7.7.6
>> -
>> diff --git =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running=
-code.patch =
b/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running=
-code.patch
>> deleted file mode 100644
>> index 5c14059..0000000
>> --- =
a/meta-multimedia/recipes-mediacentre/xbmc/xbmc/configure.in-Avoid-running=
-code.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -=46rom cfd851660a594801a591e80dc820c65cb7bd7836 Mon Sep 17 00:00:00 =
2001
>> -From: Otavio Salvador <otavio@ossystems.com.br>
>> -Date: Sat, 6 Oct 2012 06:40:03 -0300
>> -Subject: [PATCH] configure.in: Avoid running code or we break =
cross-compile
>> -
>> -Upstream-Status: Backport [similar change done for 12.0]
>> -
>> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ----
>> - configure.in |    6 +-----
>> - 1 files changed, 1 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/configure.in b/configure.in
>> -index ef94683..d7efcb0 100755
>> ---- a/configure.in
>> -+++ b/configure.in
>> -@@ -1246,11 +1246,7 @@ if test "$use_external_ffmpeg" =3D "yes"; =
then
>> -   AC_DEFINE([USE_EXTERNAL_FFMPEG], [1], [Whether to use external =
FFmpeg libraries.])
>> -
>> -   # Disable vdpau support if external libavcodec doesn't have it
>> --  AC_RUN_IFELSE(
>> --    AC_LANG_PROGRAM([[#include <libavcodec/avcodec.h>]],
>> --      [[avcodec_register_all();
>> --        AVCodec *codec =3D =
avcodec_find_decoder_by_name("vc1_vdpau");
>> --        return (codec) ? 0 : 1;]]),,
>> -+  AC_CHECK_LIB([avcodec], [ff_vdpau_vc1_decode_picture],,
>> -     [if test "x$use_vdpau" =3D "xyes"; then
>> -       AC_MSG_ERROR($ffmpeg_vdpau_not_supported)
>> -     else
>> ---
>> -1.7.2.5
>> -
>> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb =
b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>> deleted file mode 100644
>> index 0d8dd5c..0000000
>> --- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
>> +++ /dev/null
>> @@ -1,97 +0,0 @@
>> -SUMMARY =3D "XBMC Media Center"
>> -
>> -LICENSE =3D "GPLv2"
>> -LIC_FILES_CHKSUM =3D =
"file://LICENSE.GPL;md5=3D6eb631b6da7fdb01508a80213ffc35ff"
>> -
>> -DEPENDS =3D "libusb1 libcec libplist expat yajl gperf-native libxmu =
fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug =
libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer =
virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca =
avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl =
jasper zip-native zlib libtinyxml libmad"
>> -#require recipes/egl/egl.inc
>> -
>> -
>> -SRCREV =3D "82388d55dae79cbb2e486e307e23202e76a43efa"
>> -
>> -# multiple issues
>> -PNBLACKLIST[xbmc] ?=3D "/usr/include/c++/ctime:70:11: error: =
'::gmtime' has not been declared"
>> -
>> -PV =3D "11.0+gitr${SRCPV}"
>> -PR =3D "r14"
>> -SRC_URI =3D "git://github.com/xbmc/xbmc.git;branch=3DEden \
>> -           =
file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
>> -           =
file://0002-Revert-fixed-ios-Add-memory-barriers-to-atomic-Add-S.patch \
>> -           =
file://0003-Revert-fixed-ios-Add-memory-barriers-to-cas-assembly.patch \
>> -           =
file://0004-configure-cope-with-ld-is-gold-DISTRO_FEATURE.patch \
>> -           file://configure.in-Avoid-running-code.patch \
>> -"
>> -
>> -inherit autotools gettext python-dir
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# breaks compilation
>> -CCACHE =3D ""
>> -
>> -CACHED_CONFIGUREVARS +=3D " \
>> -    =
ac_cv_path_PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python" \
>> -"
>> -
>> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'opengl', 'opengl', 'openglesv2', d)}"
>> -PACKAGECONFIG[opengl] =3D "--enable-gl,--enable-gles,glew"
>> -PACKAGECONFIG[openglesv2] =3D "--enable-gles,--enable-gl,"
>> -
>> -EXTRA_OECONF =3D " \
>> -    --disable-rpath \
>> -    --enable-libusb \
>> -    --enable-airplay \
>> -    --disable-optical-drive \
>> -    --enable-external-libraries \
>> -    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-gl', =
'--enable-gles', d)} \
>> -"
>> -
>> -FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations =
-fomit-frame-pointer -O4 -ffast-math"
>> -BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
>> -
>> -EXTRA_OECONF_append_armv7a =3D "--cpu=3Dcortex-a8"
>> -
>> -# for python modules
>> -export STAGING_LIBDIR
>> -export STAGING_INCDIR
>> -export PYTHON_DIR
>> -
>> -do_configure() {
>> -    sh bootstrap
>> -    oe_runconf
>> -}
>> -
>> -PARALLEL_MAKE =3D ""
>> -
>> -do_compile_prepend() {
>> -    for i in $(find . -name "Makefile") ; do
>> -        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
>> -    done
>> -
>> -    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
>> -        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e =
's:-rpath \$(libdir):-rpath ${libdir}:g' $i
>> -    done
>> -}
>> -
>> -INSANE_SKIP_${PN} =3D "rpaths"
>> -
>> -# on ARM architectures xbmc will use GLES which will make the =
regular wrapper fail, so start it directly
>> -do_install_append_arm() {
>> -    sed -i -e 's:Exec=3Dxbmc:Exec=3D${libdir}/xbmc/xbmc.bin:g' =
${D}${datadir}/applications/xbmc.desktop
>> -}
>> -
>> -FILES_${PN} +=3D "${datadir}/xsessions ${datadir}/icons"
>> -FILES_${PN}-dbg +=3D "${libdir}/xbmc/.debug ${libdir}/xbmc/*/.debug =
${libdir}/xbmc/*/*/.debug ${libdir}/xbmc/*/*/*/.debug"
>> -
>> -# xbmc uses some kind of dlopen() method for libcec so we need to =
add it manually
>> -# OpenGL builds need glxinfo, that's in mesa-demos
>> -RRECOMMENDS_${PN}_append =3D " libcec \
>> -                             python \
>> -                             python-lang \
>> -                             python-re \
>> -                             python-netclient \
>> -                             libcurl \
>> -                             xdpyinfo \
>> -                             ${@bb.utils.contains('DISTRO_FEATURES', =
'opengl', 'mesa-demos', '', d)} \
>> -"
>> -RRECOMMENDS_${PN}_append_libc-glibc =3D " glibc-charmap-ibm850 =
glibc-gconv-ibm850"
>> --
>> 2.10.2
>>=20
>=20


--Apple-Mail=_DEB7E46A-0C3B-4727-9DF6-EB36E84A053C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlga9ggACgkQuwUzVZGdMxTgoACfdxDPt/X96Pv4CZx5DzQx3WE+
fFkAoIg9c8O1JuIyP9IWqozkMCouei11
=ueNy
-----END PGP SIGNATURE-----

--Apple-Mail=_DEB7E46A-0C3B-4727-9DF6-EB36E84A053C--
