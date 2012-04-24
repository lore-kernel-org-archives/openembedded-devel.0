Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SMmxM-0003Pv-RH
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 23:07:29 +0200
Received: by ghbz2 with SMTP id z2so784738ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=15PUsbeMY/lzZq4e4ghjXnIb6qY2bWNWYJ91MSpe2Oc=;
	b=j+OrgLoIPxk3ysE5J47/KarIH+kut44OOtXZTBZDQUBSyWCelGTPb+CcqFYuL4/r+I
	w9kcaA1Kk5/Y1xWXZ9MklcINA4mZUKdx6wp3mjY5xpNroQ+ZJsPHKcCTW/+HFw++yODQ
	za8+kO9/Z15BKlDyxQj6J9PP0ufnDVT+cb+q5G1lKz11i/JYOzTEpEQutHvMnepLvsY1
	f5yj9NrpxWvgwFAgRautsJlmU1XwUmSNblfYtTxNM1NjDEsuRGbaSWCxfzenFXeZyClb
	y7voHeyMxzR58hNyHMn+SKSfd8xV01+J3QrdpN9LJT8YM3dQLF/nUP41DUV5FEl9+2Uy
	10Wg==
Received: by 10.236.179.70 with SMTP id g46mr45029yhm.28.1335301073507;
	Tue, 24 Apr 2012 13:57:53 -0700 (PDT)
Received: from [192.168.1.14] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id f40sm12444161ani.16.2012.04.24.13.57.49
	(version=SSLv3 cipher=OTHER); Tue, 24 Apr 2012 13:57:53 -0700 (PDT)
Message-ID: <4F9713C4.2020908@gmail.com>
Date: Tue, 24 Apr 2012 13:57:40 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com> <4F9144BE.1070508@mlbassoc.com>
	<4F91A4E4.2090608@gmail.com> <4F932ADB.7040003@gmail.com>
	<4F970F9C.7030508@gmail.com>
	<1335300289.3133.136.camel@x121e.pbcl.net>
In-Reply-To: <1335300289.3133.136.camel@x121e.pbcl.net>
Subject: Re: [oe-core] 3 build machines all failing in the same manner - was:ld segfault cant figure it out
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 21:07:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2012 01:44 PM, Phil Blundell wrote:
> On Tue, 2012-04-24 at 13:39 -0700, j wrote:
>> So the qa.log I attached previously is meaningless? The
>> warnings/messages mean nothing? To me the ld segfault is the reason most
>> of qa.log has messages. Also why would oe-classic build on my laptop and
>> one of the borrowed machines with no segfaults and no issues with the
>> completed images, but then doing the new setup and version used gives me
>> the build issues on multiple machines. I also do not understand why if
>> while building, the build machine segfaults while building some package
>> but the "offending" package does not fail.
> What exactly do you mean by "the build machine segfaults"?  What
> precisely is the problem that you're having, and which particular
> messages in qa.log do you think are associated with "the ld segfault"?
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
The build machines all give messages like this just vary on libc version 
listed

[47152.769257] ld[22617]: segfault at 403 ip 00007f2149cfd435 sp 
00007fffb83ccb50 error 4 in libc-2.15.so[7f2149cb6000+197000]
2012-04-18T14:50:08-07:00 localhost kernel: [47163.860996] ld[31096]: 
segfault at 403 ip 00007fc2da152435 sp 00007fffab491c30 error 4 in 
libc-2.15.so[7fc2da10b000+197000]

qa.log has more than these messages but every machines logs are the same 
like this

udev-182: udev: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udev-182-r0/packages-split/libgudev/lib/libgudev-1.0.so.0.1.1 
links to something under exec_prefix
udev-182: ldd reports:     libudev.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libudev.so.0 
(0xdead1000)
     libgobject-2.0.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libgobject-2.0.so.0 
(0xdead2000)
     libffi.so.5 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libffi.so.5 
(0xdead3000)
     libgthread-2.0.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libgthread-2.0.so.0 
(0xdead4000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead5000)
     libglib-2.0.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libglib-2.0.so.0 
(0xdead6000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead7000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead8000)
     libgcc_s.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libgcc_s.so.1 
(0xdead9000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdeada000)

udev-182: udev: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/udev-182-r0/packages-split/udev/lib/udev/udevd 
links to something under exec_prefix
udev-182: ldd reports:     libblkid.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libblkid.so.1 
(0xdead1000)
     libkmod.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libkmod.so.2 
(0xdead2000)
     librt.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/librt.so.1 
(0xdead3000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead4000)
     libuuid.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libuuid.so.1 
(0xdead5000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead6000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead7000)

libcgroup-0.37.1: libcgroup: 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r1/packages-split/cgroups-pam-plugin/lib/security/pam_cgroup.so.0.0.0 
links to something under exec_prefix
libcgroup-0.37.1: ldd reports:     libcgroup.so.1 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/usr/lib/libcgroup.so.1 
(0xdead1000)
     libpthread.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpthread.so.0 
(0xdead2000)
     libpam.so.0 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libpam.so.0 
(0xdead3000)
     libdl.so.2 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libdl.so.2 
(0xdead4000)
     libc.so.6 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/libc.so.6 
(0xdead5000)
     /lib/ld-linux.so.3 => 
/home/gusterson/OpenEmbed/setup-scripts/build/tmp-angstrom_v2012_05-eglibc/sysroots/beagleboard/lib/ld-linux.so.3 
(0xdead6000)


each one of the machines from a fresh install have this problem. The 
resulting image boots but does not fully function. I have issues such as 
the native sdk does not install all the packages correctly.
example would be install.
normall you would find it
/usr/bin/install
I end up with
/home/bill/OE/usr/bin/install

How I have done each mahine
fresh install Ubuntu
reconfigure dash
install required packages as per OE and your distro
update then reboot
git clone angstrom setup-scripts
configure machine as beagleboard.
source the environment
build either just perl first. to save time as it will segfault building 
anything on a fresh install
or build a complete image such as xfce-nm-image or systemd-gnome-image.

I change nothing else in the configs.

Thank you for your time!


