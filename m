Received: from [64.233.184.229] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1HbkVC-0005aT-0A
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 23:37:18 +0200
Received: by wr-out-0506.google.com with SMTP id 50so244797wri
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 14:37:17 -0700 (PDT)
Received: by 10.114.152.17 with SMTP id z17mr460790wad.1176327436043;
	Wed, 11 Apr 2007 14:37:16 -0700 (PDT)
Received: by 10.114.152.15 with HTTP; Wed, 11 Apr 2007 14:37:15 -0700 (PDT)
Message-ID: <bdb0025f0704111437q2b0097ear6c10ef64cc2d2399@mail.gmail.com>
Date: Wed, 11 Apr 2007 18:37:15 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Mamona distribution
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2007 21:37:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

We are proud to announce that Mamona project is officially using OE as
it build system, and it is working fine. We are using the OE to build
.deb packages and then we are setting up a deb repository to make
easier the installation process to end user.

We already have a public (but non-official yet) deb repository where a
user can easily do a debootstrap to install Mamona and chroot to it
running all over qemu emulation.

Feel free to take a look at our non-official wiki and repository:
http://mamona.vivi.eng.br

Our Mamona OE conf files is under our internal subversion repository
yet, but we want to publish then at official OE repository to increase
the community support and make our life easier, because is very
painfull to sync monotone and svn repositories.

What is the best way to publish our mamona conf files?

Thanks,

Rodrigo Vivi
vivijim at #oe


