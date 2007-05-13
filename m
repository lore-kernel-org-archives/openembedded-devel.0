Received: from [66.249.82.224] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HnHBy-0005PD-8Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 May 2007 18:45:06 +0200
Received: by wx-out-0506.google.com with SMTP id s14so1320085wxc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2007 09:45:05 -0700 (PDT)
Received: by 10.90.86.10 with SMTP id j10mr4199960agb.1179074705064;
	Sun, 13 May 2007 09:45:05 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Sun, 13 May 2007 09:45:04 -0700 (PDT)
Message-ID: <c384c5ea0705130945k266d8bccw4f890d99d9997e52@mail.gmail.com>
Date: Sun, 13 May 2007 18:45:04 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46462BDD.6000302@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <464613B3.8090003@dominion.kabel.utwente.nl>
	<46461B73.8070900@trolltech.com>
	<46461D72.4020206@dominion.kabel.utwente.nl>
	<46462BDD.6000302@dominion.kabel.utwente.nl>
Subject: Re: uclibc 0.9.29 recipe
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
X-List-Received-Date: Sun, 13 May 2007 16:45:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen,

On 5/12/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> Koen Kooi schreef:
> To add support for your favourite machine: use uClibc.distro as .config,
> configure uclibc for the target you want, save the top 2 blocks of .config (cpu
> and arch) to uClibc.distro  in uclibc-0.9.29/<machine/uClibc.machine
>
> The recipe is by no means perfect, so any help is welcome.
>
As often, you laid the groundworks, which is often more important than
the make-it-perfect stage.

My hands are twitching to create a clean 0.9.29 .bb that more smartly
configures the library matching the OpenEmbedded configuration. But
let's hack the current setup first.

Who is using uClibc now? In other words, can I break stuff?

Regards,
-- 
Leon


