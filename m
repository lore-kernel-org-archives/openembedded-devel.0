Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IzDAO-0000bS-F5
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2007 16:25:07 +0100
Received: by an-out-0708.google.com with SMTP id b33so676756ana
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2007 07:21:37 -0800 (PST)
Received: by 10.100.229.10 with SMTP id b10mr20308385anh.1196695297758;
	Mon, 03 Dec 2007 07:21:37 -0800 (PST)
Received: by 10.90.29.19 with HTTP; Mon, 3 Dec 2007 07:21:37 -0800 (PST)
Message-ID: <c384c5ea0712030721wac64724ra20c08c4305af8c9@mail.gmail.com>
Date: Mon, 3 Dec 2007 16:21:37 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47531B1B.9000700@whitby.id.au>
MIME-Version: 1.0
References: <475207FB.8020405@whitby.id.au>
	<704452397.20071202201743@gmail.com> <47531B1B.9000700@whitby.id.au>
Subject: Re: [Angstrom-devel] RFC: Add ipkg to minimal image
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
X-List-Received-Date: Mon, 03 Dec 2007 15:25:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello World,

On Dec 2, 2007 9:52 PM, Rod Whitby <rod@whitby.id.au> wrote:
> Paul Sokolovsky wrote:
> >   While your work on getting useful small Angstrom images are of
> > course great, I think definition of minimal image as above as perfect
> > as it can get, so it would be better to create separate image. That
> > ...
> That's why I'm asking.  The axiom is not documented anywhere
> (there should be a comment at the top of each image file saying
> what the definition and intent of the image is), so one has to
> ...
Good idea.

There is also helloworld-image, which I created to show a minimal
Linux "system" consisting of kernel + "helloworld" application running
as init./

For minimal, it depends on the MACHINE I would say, but the naming
"minimal" is wrong. Minimal in what way?
A machine which has a console should not need an SSH server in minimal image.

It would be wiser to indicate purpose ("console") instead of size ("minimal").

Maybe "headless" is a better name, for an image that has no input
method, whereas "console" means "console-shell-access".

Regards,
-- 
Leon


