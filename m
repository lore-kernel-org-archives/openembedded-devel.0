Received: from [64.233.170.187] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JgM0j-0004eO-BO
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 17:33:26 +0200
Received: by rn-out-0910.google.com with SMTP id j40so668480rnf.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 08:33:22 -0700 (PDT)
Received: by 10.114.158.1 with SMTP id g1mr10195652wae.111.1206977590474;
	Mon, 31 Mar 2008 08:33:10 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Mon, 31 Mar 2008 08:33:10 -0700 (PDT)
Message-ID: <f96d234e0803310833g4565e51u2abbc47312c05f07@mail.gmail.com>
Date: Mon, 31 Mar 2008 11:33:10 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200803310907.56781.e.robertson.svg@gmail.com>
MIME-Version: 1.0
References: <200803310907.56781.e.robertson.svg@gmail.com>
Subject: Re: New OE user question
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
X-List-Received-Date: Mon, 31 Mar 2008 15:33:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 31, 2008 at 10:07 AM, E Robertson <e.robertson.svg@gmail.com> wrote:
> Hi All,
>
>  I'm brand new to OE and I've been following the documentation steps along the
>  way. I notice the documentation is either missing sections or not clear and
>  as I learn how to use this tool, I would like to update the documentation
>  sections. It's probably the least I could do as I figure out how this works.
>  I'm referirng to the user manual wiki. Both configuring and building sections
>  are missing clarity.
>  Who is responsible for the manual and how do I submit info to the sections?

The "User Manual" is maintained in the monotone repo, and can be
checked out and edited.

http://amethyst.openembedded.net/oe/viewmtn/viewmtn.py/branch/changes/org.openembedded.documentation

Patches welcome.

The rest of the documentation is in a Drupal wiki, and can be edited.
You may need a user account.

>  I got the tools built and running bitbake 1.8.10 and pulled
>  org.openembedded.dev branch. I tried to build both nano and helloworld and
>  couldn't get pass the following error. I have chosen the generic-uclibc
>  DISTRO for starters.

Try the angstrom distro first, as I don't think generic is currently
maintained.  Sigh -- the OeFaq page has been spammed :-(

This older page will tell you how to set Angstrom to uclibc until I
figure out how to restore the correct page.
http://www.openembedded.org/node/28/diff/964/1042

Cliff


-- 
=======================
Cliff Brake
http://bec-systems.com


