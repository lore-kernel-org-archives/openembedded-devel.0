Received: from [64.233.162.236] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <sdgvulpes@gmail.com>) id 1IAYrg-00018w-Bi
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2007 00:16:24 +0200
Received: by nz-out-0506.google.com with SMTP id j2so871645nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2007 15:16:00 -0700 (PDT)
Received: by 10.143.11.13 with SMTP id o13mr359334wfi.1184624159762;
	Mon, 16 Jul 2007 15:15:59 -0700 (PDT)
Received: by 10.143.40.5 with HTTP; Mon, 16 Jul 2007 15:15:59 -0700 (PDT)
Message-ID: <f34f85580707161515g7c0321edo52887f62980882fc@mail.gmail.com>
Date: Mon, 16 Jul 2007 18:15:59 -0400
From: "Todd Blumer" <sdgvulpes@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f7cl18$hum$1@sea.gmane.org>
MIME-Version: 1.0
References: <f7cl18$hum$1@sea.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: mtn disapprove ae4edc089b3dc8fc6aa34553f76502600ced6639
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
X-List-Received-Date: Mon, 16 Jul 2007 22:16:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 7/15/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> > [oe-commits] org.oe.dev fix touchscreen in OPIE on treo 650
> > slapin commit openembedded-commits at lists.openembedded.org
> > Sun Jul 15 05:14:09 CEST 2007
>
> >    * Previous message: [oe-commits] org.oe.dev Improved Palm Treo 650 support
> >    * Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
>
> > fix touchscreen in OPIE on treo 650
>
> > Setting QWS_MOUSE_PROTO in tslib.sh is probably not ideal, but I can't find a
> > better way. (signed-off by Alex Osborne <alex at hackndev.com>)
>
> Other machines can do it fine without hardcoding an event interface number _will_ change.
> So: "find a better way".

I agree with Koen. Everyone else sets QWS_MOUSE_PROTO in some script
that starts qpe (or some other Qt-based application). I have also seen
QWS_MOUSE_PROTO set in /etc/profile.d/<some sh file>


