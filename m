Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <castroenrico@gmail.com>) id 1LobrZ-00060y-PZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 13:10:39 +0200
Received: by ewy20 with SMTP id 20so2326141ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2009 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=5IrSzTkjRJHNPuTH3+RwuoRBvD4eSAT3hRuEPHkm7K8=;
	b=w5nFKO7p0qlJelbnOlUJxSLb9QWh4UTFgk2/E6Ol1Hew60l3UdroB1f/ESwtNH6l/F
	bzIB1fECU7on7b8zdBtT1nYDGxyaItuANgy2s3qgi505OOccMk1fh7G/1ykuVPzQD/70
	erkFbebehC7WWR0zEiWrzWZibW+uzKteUqzE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=nTlp6Wxto3/hmy66NNnvcFizs++of3odyKc6Rf5hW6BGaSX44ICKGv1vTS+8eSwut8
	mVoE9xiToM5YQ67uW2V6CgsTJjGVCQQx+uTi3zpVS3YT2I5StOPs2IUz0oc1vDOaO2Hk
	OGHxPz6mBhzzEF3awGiLjmwXO9fUNKNopIPLY=
Received: by 10.216.12.67 with SMTP id 45mr2003215wey.218.1238497703806;
	Tue, 31 Mar 2009 04:08:23 -0700 (PDT)
Received: from ubuntu.redarrow (net-93-144-62-113.t2.dsl.vodafone.it
	[93.144.62.113])
	by mx.google.com with ESMTPS id 10sm3638111eyz.29.2009.03.31.04.08.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 31 Mar 2009 04:08:23 -0700 (PDT)
Message-ID: <49D1F9A4.9090403@gmail.com>
Date: Tue, 31 Mar 2009 13:08:20 +0200
From: Enrico Castro <castroenrico@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49D1B395.7050004@gmail.com>
	<20090331075734.GB6971@rhein.zuhause.netz>
In-Reply-To: <20090331075734.GB6971@rhein.zuhause.netz>
Subject: Re: problem with qt-embedded
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
X-List-Received-Date: Tue, 31 Mar 2009 11:10:40 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Thank you. I choose qt4-embedded and it works.

Enrico

Henning Heinold wrote:

> 
> Hi,
> 
> which qt-embedded Version do you want qt2 or qt4? For qt2 you have to choose qte-mt
> for qt4 you have to choose qt4-embedded.
> 
> Bye Henning
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



