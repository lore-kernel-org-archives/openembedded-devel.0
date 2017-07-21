Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC14171984
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 09:08:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6L98FG1020461
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jul 2017 02:08:15 -0700 (PDT)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 02:08:15 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
	<CA+chaQcQYv4xtjOLvowSTsGA3rTn8Y92Xz-zX5ixqD2Kvm7ukQ@mail.gmail.com>
	<04626822-4244-2cfa-fc5b-14998f4691a7@windriver.com>
	<CA+chaQepvE6PLAe5-+kj8CuqTK+djKCZ+91Q6D-WJ6cCm_LdMA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <866f674a-a9b5-f69f-70a0-fbce95639e4b@windriver.com>
Date: Fri, 21 Jul 2017 17:08:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQepvE6PLAe5-+kj8CuqTK+djKCZ+91Q6D-WJ6cCm_LdMA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V2 00/10] add 9 recipes & upgrade 1 recipe
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
X-List-Received-Date: Fri, 21 Jul 2017 09:08:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年07月21日 17:06, Martin Jansa wrote:
> Because I've already updated them manually when cherry-picking to 
> master-next..
>

Thanks for pointing it out, sorry for the disturb.

//Hongxu


> On Fri, Jul 21, 2017 at 11:03 AM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     On 2017年07月21日 16:54, Martin Jansa wrote:
>>     Thanks for changes, next time please update status on patchwork
>>     when sending such mostly duplicated set of patches.
>>
>
>     OK, with a simple search in patchwork, none of these patches in
>     patchwork.
>
>     https://patchwork.openembedded.org/project/oe/series/?ordering=-last_updated
>     <https://patchwork.openembedded.org/project/oe/series/?ordering=-last_updated>
>
>     //Hongxu
>
>
>>     On Fri, Jul 21, 2017 at 9:34 AM, Hongxu Jia
>>     <hongxu.jia@windriver.com <mailto:hongxu.jia@windriver.com>> wrote:
>>
>>         Changed in V2:
>>
>>         - xmlrpc-c, satyr, usermode: fix compile failure against musl
>>         C library
>>
>>         - add recipe keybinder and volume-key
>>
>>         - Build on qemux86, qemux86-64, qemumips, qemuarm64,
>>           qemux86 + musl, qemux86-64 + musl
>>
>>         //Hongxu
>>
>>         The following changes since commit
>>         1cbd1bc195017312ba8cf670b340f61a2ac6207b:
>>
>>           unionfs-fuse: 0.26 -> 2.0 (2017-07-14 23:45:53 +0200)
>>
>>         are available in the git repository at:
>>
>>           git://git.openembedded.org/openembedded-core-contrib
>>         <http://git.openembedded.org/openembedded-core-contrib>
>>         hongxu/add-recipe2
>>         http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/add-recipe2
>>         <http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/add-recipe2>
>>
>>         Hongxu Jia (10):
>>           keybinder: add recipe 3.0
>>           volume-key: add recipe 0.3.9
>>           libgnomekbd: 2.32 -> 3.22
>>           python3-pykickstart: add recipe 2.35
>>           python3-meh: add recipe 0.45
>>           usermode: add recipe 1.111
>>           isomd5sum: add recipe 1.2.1
>>           satyr: add recipe 0.23
>>           libtar: add recipe 1.2.20
>>           xmlrpc-c: add recipe 1.31.0
>>
>>          .../gnome-settings-daemon_2.32.1.bb
>>         <http://gnome-settings-daemon_2.32.1.bb>               |   3 -
>>          .../recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
>>         <http://libgnomekbd_2.32.0.bb>  |  20 ---
>>          .../recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
>>         <http://libgnomekbd_3.22.0.bb>  |  17 +++
>>          .../recipes-support/keybinder/keybinder_3.0.bb
>>         <http://keybinder_3.0.bb>    |  26 ++++
>>          ...ix-compile-failure-against-musl-C-library.patch |  27 ++++
>>          .../recipes-support/usermode/usermode_1.111.bb
>>         <http://usermode_1.111.bb>    |  27 ++++
>>          meta-oe/licenses/X11      |  23 ++++
>>          ...ix-compile-failure-against-musl-C-library.patch |  52 +++++++
>>          .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
>>         <http://xmlrpc-c_1.31.0.bb>  |  23 ++++
>>          .../files/0001-tweak-install-prefix.patch         |  60 ++++++++
>>          .../isomd5sum/files/0002-fix-parallel-error.patch |  33 +++++
>>          .../recipes-extended/isomd5sum/isomd5sum_1.2.1.bb
>>         <http://isomd5sum_1.2.1.bb> |  35 +++++
>>          ...-explicitly-support-python3-by-pkg-config.patch |  56
>>         ++++++++
>>          .../volume_key/volume-key_0.3.9.bb
>>         <http://volume-key_0.3.9.bb>                |  34 +++++
>>          .../libtar/files/0002-Do-not-strip-libtar.patch   |  25 ++++
>>          .../libtar/files/fix_libtool_sysroot.patch        |  19 +++
>>          meta-oe/recipes-support/libtar/libtar_1.2.20.bb
>>         <http://libtar_1.2.20.bb>   |  21 +++
>>          .../satyr/files/0001-do-not-support-python2.patch |  84
>>         ++++++++++++
>>          ...ix-compile-failure-against-musl-C-library.patch |  28 ++++
>>          meta-oe/recipes-support/satyr/satyr_0.23.bb
>>         <http://satyr_0.23.bb>       |  33 +++++
>>          .../files/tweak-native-language-support.patch     |  44 ++++++
>>          .../python-meh/python3-meh_0.45.bb
>>         <http://python3-meh_0.45.bb>                |  17 +++
>>          ...0001-support-authentication-for-kickstart.patch | 151
>>         +++++++++++++++++++++
>>          ...-parser.py-add-lock-for-readKickstart-and.patch |  76
>>         +++++++++++
>>          ...-sections-shutdown-and-environment-in-gen.patch |  48 +++++++
>>          ...d.py-retry-to-invoke-request-with-timeout.patch |  82
>>         +++++++++++
>>          .../python-pykickstart/python3-pykickstart_2.35.bb
>>         <http://python3-pykickstart_2.35.bb> |  26 ++++
>>          27 files changed, 1067 insertions(+), 23 deletions(-)
>>          delete mode 100644
>>         meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
>>         <http://libgnomekbd_2.32.0.bb>
>>          create mode 100644
>>         meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.22.0.bb
>>         <http://libgnomekbd_3.22.0.bb>
>>          create mode 100644
>>         meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
>>         <http://keybinder_3.0.bb>
>>          create mode 100644
>>         meta-gnome/recipes-support/usermode/usermode/0001-fix-compile-failure-against-musl-C-library.patch
>>          create mode 100644
>>         meta-gnome/recipes-support/usermode/usermode_1.111.bb
>>         <http://usermode_1.111.bb>
>>          create mode 100644 meta-oe/licenses/X11
>>          create mode 100644
>>         meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
>>          create mode 100644
>>         meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
>>         <http://xmlrpc-c_1.31.0.bb>
>>          create mode 100644
>>         meta-oe/recipes-extended/isomd5sum/files/0001-tweak-install-prefix.patch
>>          create mode 100644
>>         meta-oe/recipes-extended/isomd5sum/files/0002-fix-parallel-error.patch
>>          create mode 100644
>>         meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.1.bb
>>         <http://isomd5sum_1.2.1.bb>
>>          create mode 100644
>>         meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
>>          create mode 100644
>>         meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb
>>         <http://volume-key_0.3.9.bb>
>>          create mode 100644
>>         meta-oe/recipes-support/libtar/files/0002-Do-not-strip-libtar.patch
>>          create mode 100644
>>         meta-oe/recipes-support/libtar/files/fix_libtool_sysroot.patch
>>          create mode 100644
>>         meta-oe/recipes-support/libtar/libtar_1.2.20.bb
>>         <http://libtar_1.2.20.bb>
>>          create mode 100644
>>         meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
>>          create mode 100644
>>         meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
>>          create mode 100644
>>         meta-oe/recipes-support/satyr/satyr_0.23.bb
>>         <http://satyr_0.23.bb>
>>          create mode 100644
>>         meta-python/recipes-extended/python-meh/files/tweak-native-language-support.patch
>>          create mode 100644
>>         meta-python/recipes-extended/python-meh/python3-meh_0.45.bb
>>         <http://python3-meh_0.45.bb>
>>          create mode 100644
>>         meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
>>          create mode 100644
>>         meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
>>          create mode 100644
>>         meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
>>          create mode 100644
>>         meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
>>          create mode 100644
>>         meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
>>         <http://python3-pykickstart_2.35.bb>
>>
>>         --
>>         2.8.1
>>
>>
>
>


