Received: from [64.233.184.229] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nicolasfr@gmail.com>) id 1Goo6c-0008Fy-Ci
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Nov 2006 22:33:38 +0100
Received: by wr-out-0506.google.com with SMTP id i32so253579wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2006 13:33:29 -0800 (PST)
Received: by 10.78.127.3 with SMTP id z3mr82323huc.1164663207773;
	Mon, 27 Nov 2006 13:33:27 -0800 (PST)
Received: by 10.78.160.8 with HTTP; Mon, 27 Nov 2006 13:33:27 -0800 (PST)
Message-ID: <b9481e140611271333h2aad2dcxa8a2f48847ff64ea@mail.gmail.com>
Date: Mon, 27 Nov 2006 22:33:27 +0100
From: "Nicolas FR" <nicolasfr@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b9481e140611271305j26d156e8r3fb35fb3ff35be68@mail.gmail.com>
MIME-Version: 1.0
References: <b9481e140611271305j26d156e8r3fb35fb3ff35be68@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
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
X-List-Received-Date: Mon, 27 Nov 2006 21:33:39 -0000
Content-Type: multipart/mixed; 
	boundary="----=_Part_63140_28756004.1164663207691"

------=_Part_63140_28756004.1164663207691
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Oops, screwed up my own patch!

Here is the correct one :)

On 11/27/06, Nicolas FR <nicolasfr@gmail.com> wrote:
> The bugtracker seems down for a few days, so I post this here.
>
> I have been playing with disto = sharprom-compatible for a few days.
> So here is a small patch to palmtop.bbclass to make gcc-2.95 happy
> when building opie stuff (seem the first patch made here was wrong,
> removing libstd++ instead of removing libsupc++):
>
> Nicolas.
>
>
>

------=_Part_63140_28756004.1164663207691--
