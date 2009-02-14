Received: from [209.85.218.213] (helo=mail-bw0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LYH24-0003Hq-NT
	for openembedded-devel@openembedded.org; Sat, 14 Feb 2009 10:41:56 +0100
Received: by bwz9 with SMTP id 9so2049813bwz.12
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Feb 2009 01:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=aunTniSMK7kZefP28aPr8EnX0QQbpQNxp76M8XzEzcA=;
	b=LCSwxkG0CaSpYWt4wPjK0DUNaTFSbqE3kEcr5zFUU3IZ3Mdc8H4AHs3PyGK2JXAXUn
	H452D4DrgZp4vvEbN1VK291+hrJaT1Gp5yiLjgXaFG6WEps/f2v9F771GAIzZqVvAbDr
	Knn1/EYdMYTbuUActmfFFdJzxbnRNbBT0LDN8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=c5yCkx9Cb2454f/114DKCjnKG/xAOxBHPlb28wulxWnkt2RTtAxm/u72WcbmmlwK1F
	4R6HyzuEt2KZDQQd9X3RMHncNZnCwlqJeatfS5lRo7g2UtPCXrEgAfOowL7WYDinrFBN
	mqIrCJVhPAIj6crZKYVJiKJq4LipRGQ82HgnY=
MIME-Version: 1.0
Received: by 10.181.234.5 with SMTP id l5mr1066542bkr.124.1234604422320; Sat, 
	14 Feb 2009 01:40:22 -0800 (PST)
In-Reply-To: <c384c5ea0902131538o47bbbfa1oed7415d40d58bbbd@mail.gmail.com>
References: <200902121727.21796.roman@khimov.ru>
	<c384c5ea0902120728n459671f4y32957b212a8af0ed@mail.gmail.com>
	<gn1j5m$qc5$2@ger.gmane.org> <200902130952.52664.roman@khimov.ru>
	<gn3d3v$um5$2@ger.gmane.org>
	<c384c5ea0902131538o47bbbfa1oed7415d40d58bbbd@mail.gmail.com>
Date: Sat, 14 Feb 2009 10:40:22 +0100
Message-ID: <c384c5ea0902140140u437d5135w1fd2469612924d27@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] icecc: base fix for cross and native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Feb 2009 09:41:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Applied.

-- 
Leon


