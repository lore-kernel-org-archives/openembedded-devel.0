Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D81897F2DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 20:57:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46S0pV47przCH;
	Mon,  9 Sep 2019 22:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568062626;
	bh=jNqfyQMy+K5Ztf5SdA/LZspIJBHxH4WnXDwJKNHAhDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikkyoQTBf6LZoO1t0KAqv6ZnFlO+qL4jGhTQ03VqaxnNMSwtkt8F2pf95d7YjGqVg
	URwu831ktVQsUyhn3kkOe1s6Ddi7XApkzLxs4UQrhGdmVbS+D7eoGAqik5VipKox/I
	p2EQ8ojlGvm0/0vnaTNxpn4OTw4DgGSpuBax7hGzLIArZnPSmadKU803vLtxucWZn4
	fC268U5D0K73YO/glfS1f9L1nzcNyR6DIUYTlkO8xOq3uQHBwhRwhopIrHBGMfcL7Q
	xxKszEvnVsiMhi8FIlZh7JVIq2WnxcE6XFBHx+2SOl2vpHNUzYGMJOZekCZq0Tn+2a
	7z3I7ct/U8lxA5IB1k5IuWTGmLBvLNsnGAlyI8IOpsgl2V0vcwRWVaZe3O3hkzIazD
	TUL8X2M1IdopnPjD7LgF/dYMPNiwhErRULTssCb/Ei2PK4hR04ksHkBPYQlhQgqTYj
	2qbDi7M8xy2OwrFGGgb3CQvzcoicBtDsd7FKFJbPKKn9prYHCMJtPPEehnZylFlUQK
	EwJqApGd2QR81dF+VfWj6i0SHKcXjzSfu+ZcM5DuWl7PKRmaEMbuVxEIiJis+mASVD
	wBV5VTsz4LpWHC4nbqwqvXwtZi6ZdDA83DX5aMQ3I7C0vD7gC31ej7KHyNxCEi3oRf
	9J86CAR6EULP12HeT0/fDUoo=
Date: Mon, 9 Sep 2019 23:57:04 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mathieu =?utf-8?Q?Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>
Message-ID: <20190909205704.GA14642@localhost>
References: <b6f2c586-cb29-5015-ec35-ab2c7dcf8d4d@amotus.ca>
MIME-Version: 1.0
In-Reply-To: <b6f2c586-cb29-5015-ec35-ab2c7dcf8d4d@amotus.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Support for OpenJDK 9+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Sep 2019 20:57:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 09, 2019 at 07:52:16PM +0000, Mathieu Alexandre-Tétreault wrote:
> Howdy,
> 
> We recently got a request to add support for Java(OpenJdk) 9+.
> I came to wonder if there was any limitations preventing the use of 
> Openjdk 9+ on arm?
> 
> Any advise will be appreciated.

Debian stable ships OpenJDK 11 on three different arm architectures.

> Cheers,
> 
> Mathieu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


