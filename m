Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D6CB97F7B1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:22:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47QKVR0cz7z4M;
	Sat, 30 Nov 2019 19:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575138159;
	bh=scrD7dKURPCTP5J6SBq13KeALSlC2uBo2P+qnyYrZhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pi4kD92FywSBS+b5oYBadChTAzeT1SAEY5/zm/wk1A7g+NNqXUIdEDygN3Uhvluq6
	MgCuoqAtB6ejuBy60MMp8cemVD9luxlLkAZnhxkAeRCJV3Wb7FZahq7rKpuChY2PDq
	ZF0KcghjA/S8h7GCiuGg7OQb0rzhU4udo5h0/vMaZkQNYyA8iQ5qLDsqC7khAcY03M
	R3a4OqbVbUTO21kEvvHBgCaEu3FfgXosQJNXZiT+adXDmREEUYQEQNQz9GiwVMVotB
	9oNSl3TR61McPf8iwZ1h2jsnVX09Ry/z454GmxCHfQyp5vuzP6TDjFlixNzn9o5tCf
	b+btdXFg872FV617+YRDlboESzdNX67Hw4IlPda4Hf97ys03CSK4VPcc/fLLDaMmqO
	LE2HE6WaRJQNUOF5dn0HR4hlOibBryXNj2+ws2A8thB/HfgynERuir0PYhjw4FhwNi
	rp+Cb+KpZBnyPDTvDFA5R9oug6u6Zg8yhuraXE35hiwvq5E48KrRD603iIXM+n4x03
	qLCr65w4lcSB9P1zhv23+iagGLYS6SYLyCwbnMkOznPaSNJEkC0+K4DH0N/yiWzPQf
	ekLU9PrlsFM3igkNSLH2YTccvx6kYvQjrdcqiCufbwz2JspXodFcvOE27KWaiAehmV
	i8y3Vf/AB0/7Gw737yLk0KJ8=
Date: Sat, 30 Nov 2019 20:22:30 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20191130182230.GB4526@localhost>
References: <cover.1575137343.git.akuster808@gmail.com>
	<3eb4c7a0825bd750dfb71fc5ff1e738daf9adcdf.1575137343.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3eb4c7a0825bd750dfb71fc5ff1e738daf9adcdf.1575137343.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 03/15] python-more-itertools.inc: fix python2 package not incorrectly generated
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
X-List-Received-Date: Sat, 30 Nov 2019 18:22:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This needs two more patches, see
http://lists.openembedded.org/pipermail/openembedded-devel/2019-November/203247.html

Thanks
Adrian

