Received: from [64.233.162.193] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1Goo2x-0008Bw-QY
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Nov 2006 22:29:51 +0100
Received: by nz-out-0102.google.com with SMTP id m22so713177nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2006 13:29:43 -0800 (PST)
Received: by 10.35.111.14 with SMTP id o14mr176145pym.1164662982903;
	Mon, 27 Nov 2006 13:29:42 -0800 (PST)
Received: by 10.35.119.19 with HTTP; Mon, 27 Nov 2006 13:29:37 -0800 (PST)
Message-ID: <432beae0611271329j4d94944frd1bde13c518f848@mail.gmail.com>
Date: Mon, 27 Nov 2006 13:29:37 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b9481e140611271305j26d156e8r3fb35fb3ff35be68@mail.gmail.com>
MIME-Version: 1.0
References: <b9481e140611271305j26d156e8r3fb35fb3ff35be68@mail.gmail.com>
Subject: Re: Small fix for sharprom
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
X-List-Received-Date: Mon, 27 Nov 2006 21:29:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/27/06, Nicolas FR <nicolasfr@gmail.com> wrote:
> The bugtracker seems down for a few days, so I post this here.
>
> I have been playing with disto = sharprom-compatible for a few days.
> So here is a small patch to palmtop.bbclass to make gcc-2.95 happy
> when building opie stuff (seem the first patch made here was wrong,
> removing libstd++ instead of removing libsupc++):
>

Your patch didn't make it to the list. Try naming it with a .txt
extension so that your mailer sends it with a text mime-type.

-- 
Justin Patrin


