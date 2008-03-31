Received: from [209.85.162.177] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JgNYK-0003hH-0Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 19:12:12 +0200
Received: by el-out-1112.google.com with SMTP id s27so574584ele.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 10:12:09 -0700 (PDT)
Received: by 10.114.109.1 with SMTP id h1mr10466529wac.35.1206983528072;
	Mon, 31 Mar 2008 10:12:08 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Mon, 31 Mar 2008 10:12:07 -0700 (PDT)
Message-ID: <f96d234e0803311012q1c886adby92c2d6b657ceba48@mail.gmail.com>
Date: Mon, 31 Mar 2008 13:12:07 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: "E Robertson" <e.robertson.svg@gmail.com>
In-Reply-To: <200803311119.53596.e.robertson.svg@gmail.com>
MIME-Version: 1.0
References: <200803310907.56781.e.robertson.svg@gmail.com>
	<f96d234e0803310833g4565e51u2abbc47312c05f07@mail.gmail.com>
	<200803311119.53596.e.robertson.svg@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 31 Mar 2008 17:12:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 31, 2008 at 12:19 PM, E Robertson <e.robertson.svg@gmail.com> wrote:
> > The "User Manual" is maintained in the monotone repo, and can be
>  > checked out and edited.
>  >
>  > http://amethyst.openembedded.net/oe/viewmtn/viewmtn.py/branch/changes/org.o
>  >penembedded.documentation
>  >
>  > Patches welcome.
>
>  I'm not sure how your patch system works. I could checkout the documentation
>  branch and edit it but should I do a diff and submit it? Or would it be best
>  to edit the wiki?

Depends on the source of the documentation.  There is no way to edit
the user manual through the wiki -- they are two different types of
documentation.

To edit the user manual, yes, create a diff and post to the OE
bugzilla or dev maillist.

>  Would it be better to stick to one distro for the documentation? I think that
>  would be best. Having said that, would Angstrom be the best place to start?
>  I was looking for a simple distro to start with and I thought Angstrom might
>  be a bit bulky. I'll use which ever the suggested one it.

Probably so, especially as very few people use generic.  The
perception that Angstrom is bulky is not correct as you can build a
number of different images, that vary in size.  The distro does not
dictate the image size -- the image recipe does that.  The main
benefit of using Angstrom is that it chooses version of packages that
are known to work together.

You may also want to consider the "stable" OE branch for getting started.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


