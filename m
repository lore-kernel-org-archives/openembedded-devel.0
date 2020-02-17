Return-Path: <prvs=3095e736d=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 113CD60AEC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 07:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1581923341; x=1613459341;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=SpUudRmQge4Fj+BVSASTHTnaE7dOZ9FvWtJDoU9CoxU=;
	b=dw3jSHswt7fRZLIPgM8g4caF+jgpxhimPNHnfHc6ou5Xuu17BM/VnPOs
	6LnAxfh/bjOQ2aQbYffL+x8eGbnVttMypMsXWD4BbUjd28nlOpeB8jgl8
	3GbJrnKLinR58nt5NjY0cB5itG/OhOtkNErnUmmdPwHIPAyjIlN2Zi4GG
	R/PU09cUBFMeVyx+rf41HI4j7OVoNZutRsj5Xmlh2VgYMHuiJtbY4FWl+
	fNb6PFy+XZ1It6E85d1Q+8GtgJzIlvCuZ3v0RN3VA+CQeW/Nzx3SusD5P
	OHSsNmD2Jwtuklba9C/+GH2CN/c1P8RIU12eSSHMZaL0AUF+KFz+CZ0xT g==;
IronPort-SDR: Ju5Atp7RkDDPb74s2pC+ZkOJ9wOFtz6j1NEnhwdMnyW3CWoBuWxsA6wVlqhLiQ1CA7Fky3yR1K
	jjrqcdRHGln9A4O7jBYSZs5Q/8984UCEKblVOVorG93oxcyJplwWMgQtA7P+83ERTzonUjGcsJ
	rBAfyfkOdz5UvqJuoo8qMEabQBrHZjIEg7LbutLLI4MsQJVqz7wB6+6Zg9A7iYGXeoiv6ka42l
	4YvlgByysbapE7jhEKmZEQyEQbOsoTPTVaX/qgO0tt+4Xr3kySDf2e0ZEeid/ZwCYFkQFuDzBZ
	fHs=
X-IronPort-AV: E=Sophos;i="5.70,451,1574118000"; 
   d="scan'208";a="2522124"
Date: Mon, 17 Feb 2020 08:08:58 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <20200217070858.GA2701920@pcleri>
References: <22639ede-b55a-3e33-3ac3-c462b1e37b62@mvista.com>
MIME-Version: 1.0
In-Reply-To: <22639ede-b55a-3e33-3ac3-c462b1e37b62@mvista.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Cherry pick patches breaking zeus/thud/master.
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
X-List-Received-Date: Mon, 17 Feb 2020 07:09:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Jeremy,

On Thu, Feb 13, 2020 at 12:15:07PM -0800, Jeremy A. Puhlman wrote:
> Richard,
> 
> Is it possible to cherry pick
> 
> d0a9fe08be6e1c2e7f7afc79abc292d3bffeb9fe
> Revert "openjdk-8: disable, stringop-overflow compiler errors"
> 
> to zeus/thud/master, since they are breaking for the same reason as warrior?

Sure, I'll push the changes today.

regards;rl

> 
> TIA
> 
> -- 
> Jeremy A. Puhlman
> jpuhlman@mvista.com
> 

