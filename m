Received: from [209.85.198.185] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1InHxL-0006XE-3X
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2007 19:06:19 +0100
Received: by rv-out-0910.google.com with SMTP id c24so193675rvf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2007 11:06:06 -0700 (PDT)
Received: by 10.141.86.14 with SMTP id o14mr4049483rvl.1193850066476;
	Wed, 31 Oct 2007 10:01:06 -0700 (PDT)
Received: by 10.141.203.2 with HTTP; Wed, 31 Oct 2007 10:01:06 -0700 (PDT)
Message-ID: <f96d234e0710311001p6d8c205fp6ecf8829bd8edf6c@mail.gmail.com>
Date: Wed, 31 Oct 2007 13:01:06 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4727C038.10002@gmx.net>
MIME-Version: 1.0
References: <4727C038.10002@gmx.net>
Subject: Re: I want your autobuilder scripts
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
X-List-Received-Date: Wed, 31 Oct 2007 18:06:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/30/07, Robert Schuster <theBohemian@gmx.net> wrote:
> Hi,
> at OEDEM it was my impression that several of you have working
> autobuilder setups for OpenEmbedded. Can I get the scripts that make
> that possible from somewhere?

The build setup I use is:
https://dev.bec-systems.com/svn/oe/build

It is loosely based off the openmoko makefile (mostly just
documentation), and with a directory setup that allows me to build for
multiple machines, distros, OE trees, etc.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


