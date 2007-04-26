Received: from [64.233.162.224] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1HhCYu-0005bv-T1
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2007 00:35:41 +0200
Received: by nz-out-0506.google.com with SMTP id m22so860499nzf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 15:26:49 -0700 (PDT)
Received: by 10.114.111.1 with SMTP id j1mr780590wac.1177626408753;
	Thu, 26 Apr 2007 15:26:48 -0700 (PDT)
Received: by 10.115.92.7 with HTTP; Thu, 26 Apr 2007 15:26:48 -0700 (PDT)
Message-ID: <432beae0704261526j3817e929nba2d3900177420d1@mail.gmail.com>
Date: Thu, 26 Apr 2007 15:26:48 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <1177626232.4992.8.camel@cimmeria.hyboria>
MIME-Version: 1.0
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
	<4630E310.5000008@dominion.kabel.utwente.nl>
	<432beae0704261110i5aa9f201te5144ccd97609222@mail.gmail.com>
	<1177625217.4992.1.camel@cimmeria.hyboria>
	<432beae0704261516y62dda543o62676432ac1bee76@mail.gmail.com>
	<1177626232.4992.8.camel@cimmeria.hyboria>
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 22:35:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/26/07, Graeme Gregory <dp@xora.org.uk> wrote:
> On Thu, 2007-04-26 at 15:16 -0700, Justin Patrin wrote:
> > I was under the impression that /home was normally writable only by
> > root and the subdirs were normally only writable by the user who owns
> > the directory (yes, I know you can set them differently if you want).
> > I know I wouldn't want joe-the-user creating directory /home/justinpa
> > to try to confuse justinp whose home dir is /home/justinp.
> >
> So someone makes an Angstrom based distro that is distributed on Ipaqs
> to a school that person happens to be called John Smith (a very common
> uk name). A kid at the school uses one in class and he happens to be
> called John Smith and is kinda smart. Suddenly he is root.
>

Sure. As I said this does need to be fixed. Sorry, I tend to get
sarcastic when responding to Koen.

-- 
Justin Patrin


