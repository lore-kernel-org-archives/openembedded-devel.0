Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <loudawgucr@gmail.com>) id 1JwyZN-0001kO-48
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 May 2008 13:57:59 +0200
Received: by an-out-0708.google.com with SMTP id b38so185726ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2008 04:56:03 -0700 (PDT)
Received: by 10.100.178.13 with SMTP id a13mr3981137anf.29.1210898043585;
	Thu, 15 May 2008 17:34:03 -0700 (PDT)
Received: by 10.100.57.18 with HTTP; Thu, 15 May 2008 17:34:03 -0700 (PDT)
Message-ID: <5e50ac960805151734t2a67e113vbb9a449c7ad57e3d@mail.gmail.com>
Date: Thu, 15 May 2008 17:34:03 -0700
From: "Louie Ilievski" <loudawgucr@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.10b4
Subject: Kernel boot issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 16 May 2008 11:58:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I tried booting a freshly built x11-gpe-image on my Axim x51v but ran into a
problem.  Haret reads the kernel just fine it seems, and then it goes to the
black console.  I see a few messages, and then nothing happens, requiring a
reboot.  Here is what I see:

HaRET boot
Shutting down hardware
In preloader
PSR=600000df
Tags relocated
Kernel relocated
Initrd relocated
Jumping to kernel...

I am trying to boot off of an SD card with the rootfs on the second
partition.

Any ideas?

Thanks,

~Lou

