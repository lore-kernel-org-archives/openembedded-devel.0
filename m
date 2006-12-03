Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Gqvk5-0001Ux-9T
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Dec 2006 19:07:09 +0100
Received: by nf-out-0910.google.com with SMTP id l24so3994655nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Dec 2006 10:06:26 -0800 (PST)
Received: by 10.49.75.2 with SMTP id c2mr12046943nfl.1165169186612;
	Sun, 03 Dec 2006 10:06:26 -0800 (PST)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id m15sm42381065nfc.2006.12.03.10.06.26;
	Sun, 03 Dec 2006 10:06:26 -0800 (PST)
Date: Sun, 3 Dec 2006 20:06:26 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <12210507408.20061203200626@gmail.com>
To: "Alan Carvalho de Assis" <acassis@gmail.com>
In-Reply-To: <37367b3a0612021013p700b017bmdaa382eb76527c8e@mail.gmail.com>
References: <37367b3a0612021013p700b017bmdaa382eb76527c8e@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, Vladimir <vovan888@gmail.com>
Subject: Re: New palm environment
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
X-List-Received-Date: Sun, 03 Dec 2006 18:07:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Alan,


      [There were few cheerful replies, so let me show the other side
of it, and do a bit of cold shower. Note that it's only rhetoric
exercise - you will still do what you're bound to ;-) .]


Saturday, December 2, 2006, 8:13:50 PM, you wrote:

> Dear developers,
> I want know if is of worth start a new project to develop a palm/phone
> environment using FLTK toolkit.

  No.

> GPE and Opie are powerful projects, but some devices with small
> footprint and slow processors don't work very well with it.

  What makes you think they will work better with something else? More
specifically, what makes you think they will work better with framework
of the order of magnitude/scale as OPIE or GPE?

  For example, do you think that OPIE/GPE authors set it as the aim to
write fat slow frameworks? Or they have secret conspiracy to do it so?
In this case, they are must be involved with proverbial Microsoft too
- it has own UI system, by pretty different technology, but it shows
the same problems!

> This idea appeared when me and Vladimir (who ported Linux to Siemens
> SX1 phone) are speaking about Qt/Embedded and GPE performance on SX1.

  You know, such bright ideas appear to someone every other week ;-I.
For example, another Vladimir (who ported PalmT3) just couldn't resist
to start his own toy: http://hackndev.com/node/571 .

> Some possible toolkit are: FLTK2, pixil or minigui. We think FLTK is a
> good option, because it has some modern features and still small and
> fast.

  Now, that's interesting. *Some* modern features - I will trust your
word, obviously, how could you expect for 2nd-rate GUI toolkit to
provide all modern features? But fast - that's interesting. Do you
have real-world profiling data with good interpretation, preferably,
all yours? Or you trust FLTK authors by word too?

> I want know what you think about it?

  I think that spending time on optimizing existing full-fledged UI
framework, like OPIE or GPE, would be much more beneficial for both
persons who would do that, and for community. YMMV.

> Cheers,

> Alan


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



