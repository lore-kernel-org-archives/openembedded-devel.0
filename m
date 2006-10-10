Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GXPph-0006ND-6g
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Oct 2006 00:12:17 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 7FFA7ADA0A;
	Wed, 11 Oct 2006 08:06:03 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23590-01; Wed, 11 Oct 2006 08:06:01 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id D51FBAD9F4;
	Wed, 11 Oct 2006 08:06:01 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id CCCC7122F691; Wed, 11 Oct 2006 08:06:01 +1000 (EST)
Date: Wed, 11 Oct 2006 08:06:01 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Nicolas FR <nicolasfr@gmail.com>
Message-ID: <20061010220601.GA20799@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Nicolas FR <nicolasfr@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <b9481e140610100631u25d9bc4dm7f6483c20e3c482d@mail.gmail.com>
Mime-Version: 1.0
In-Reply-To: <b9481e140610100631u25d9bc4dm7f6483c20e3c482d@mail.gmail.com>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Bitbaking a recipe which refers to a missing bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 22:12:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 10, 2006 at 03:31:42PM +0200, "Nicolas FR" wrote:
> Hi,
> 
> I have noticed that when bitbaking a recipe which refers to a missing
> .bbclass definition, there where no warning / error.

I've noticed the same thing and I agree that it's rather annoying.
I'd much rather it fail then continue on and do something else.

-- 
 Jamie Lenehan <lenehan@twibble.org>


