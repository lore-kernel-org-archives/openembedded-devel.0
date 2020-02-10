Return-Path: <prvs=30255aeaa=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6C260C96
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1581329843; x=1612865843;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=nKZvYb71XFFqfE7tL8CIR6Q+0bmb/JR/ILBm16ZksCA=;
	b=Qs2XGHA8PK+XST66zl4zENO8+2071vcdkc4hKHAJb8Lhu1KG8dHcu7jm
	y/O7iz+gl4XkDiqqrgTDv41UVO6Coo1y5aWpIMX+2P7GwKZxgWBD/iYgi
	Goh0pnK+FhABrKwFK4mAZRTKgtylU5BtxKLnpqRAxn+BJBUjWL76WAUbD
	dJdVK0SIveawAinkXG/no3v02k/G5o7JdOGLRuJxlsN37PowXJfh7fybq
	ohwRE9U6nUPGjFjpdlsHne97acGQy4Dba704NXDGbhXPlApHOWwa6Eubr
	YP1/exYXty5sRGuAnIsbIS/zLptja6NqZMZvFtZcyVgmMtMv9ZUAbe34/ A==;
IronPort-SDR: ZjIwNGTrFKNUfcp9nbPx1Car94yd5hb/W7G7Vk5+l9Y2KUGD91Z/PyfztbGkmN4RmdpLqrvFTW
	IX/6ym6VPQYHa5qAewuS44w1xHaSjg9XFEmxIO8qBbeYW1O+8+pPWJgCjyN1/1YnbU8FdogdmI
	CZGUpEhqbKxyV/ZqiL9rR+g89bTBHMJr18tVlwPa7Fz3TqTmeRnMvG6Rn2tWLiBBlYSPx8Tu//
	UHri9dR2Dzr/ClORf+rPHAr0y3KK9IeEiYJQxWhAnPUX7RbU0OmJ8q+HWeJ1YYLdZSTT3hSKqP
	6ok=
X-IronPort-AV: E=Sophos;i="5.70,424,1574118000"; d="scan'208";a="22567165"
Date: Mon, 10 Feb 2020 11:17:21 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Kyle Russell <bkylerussell@gmail.com>
Message-ID: <20200210101721.GB6809@pcleri>
References: <CAFrQVPN-BGUPWXvDfdhU+VxY-D-ULVcpM7fYcFnMBVbN9-hNoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFrQVPN-BGUPWXvDfdhU+VxY-D-ULVcpM7fYcFnMBVbN9-hNoQ@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] OpenJDK11 LTS
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
X-List-Received-Date: Mon, 10 Feb 2020 10:17:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Kyle,

On Fri, Jan 31, 2020 at 04:22:40PM -0500, Kyle Russell wrote:
> Has any work been done towards supporting OpenJDK11 with meta-java?  I've
> been using openjdk-8, and would be interested in helping contribute support
> for the next LTS if there's interest.  I wanted to know if anyone is
> actively pursuing this first though, or if anyone has uncovered additional
> dependencies that need to be sorted out first.

Currently I haven't done any work regarding OpenJDK-11 integration in
meta-java.
Nonetheless I will fully support any work going in this direction!

regards;rl

> 
> Kyle

