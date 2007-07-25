Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1IDkkg-0001vN-9P
	for openembedded-devel@openembedded.org; Wed, 25 Jul 2007 19:34:22 +0200
Received: by wa-out-1112.google.com with SMTP id v27so302337wah
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Jul 2007 10:33:05 -0700 (PDT)
Received: by 10.114.158.1 with SMTP id g1mr860877wae.1185384784832;
	Wed, 25 Jul 2007 10:33:04 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Wed, 25 Jul 2007 10:33:04 -0700 (PDT)
Message-ID: <f96d234e0707251033ledbb19bg8a93154765ec3fbe@mail.gmail.com>
Date: Wed, 25 Jul 2007 13:33:04 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46A65F33.9020808@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <HOECLKEKOHLAMMGDLLBHEEPLLLAA.skoroneos@digital-opsis.com>
	<46A65F33.9020808@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] Angstrom Core Team
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
X-List-Received-Date: Wed, 25 Jul 2007 17:34:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 7/24/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Stelios Koroneos schreef:

> That is indeed a big problem, which we want to tackle from the OE side with regular
> tarball releases and autobuilds[2]. See the guadec meeting notes on that.
> Suggestions from commercial users are *very* welcome on this subject.

I have implemented OE (and Angstrom in more recent projects) in at
least 7 embedded projects.  Overall, it has a been a great success
compared to any other method for getting Linux on embedded devices.
Sure there is occasional breakage, but in my experience, it has been
pretty rare -- especially for mainstream stuff.  For what I do, the
availability of _lots_ of current package in my mind far outweighs the
occasional breakage.  As a project, OE still has limited resources, so
I think our time is best spent moving things forward, and doing
autobuilds to keep the quality up.  I recently added a bunch of disk
space to my build machine and hope to contribute more to the autobuild
effort.

> One last thing: autobuilds, autobuilds, autobuilds

Agreed!

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


