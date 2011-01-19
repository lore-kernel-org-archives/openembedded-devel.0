Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PfglB-0001sN-UD
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 23:44:13 +0100
Received: by ewy28 with SMTP id 28so882260ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 14:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ODeTxy9QBr0cDveBAqpQO/acK02CYZvkPBUlR2qxfbA=;
	b=GHqBZjj8mhQbEoqMtn4FhH8NkaWR/TUtQr0DlxFlQDdnvGa7EAEXGdypl3lPh30Aj6
	HpDSWVQ6mPkQR+TbQApC7tuiHq0gF7F+305IS6ZX7ZJf+YyXLOXDOGk1IYMwI7FFz0if
	M/L6C60mr0GNlvbIo/CX3HKjf4oI3RXQK+u6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ReqbpiiUHTb0iKxLNC8iGE96uI6tApJkZn4P0U+9E7UZk6PeRSjSEAWY8nFjSNyFxo
	ez/NjLrsysPGiBKNd3MsT/WaqiO4LIoSS7kD772YDHrUmtw5+FILJoYKnyurmsZ8RrMB
	teGoK7DS66yJeWQQVUTiPLaHPGCgTMuP0mH44=
MIME-Version: 1.0
Received: by 10.227.143.65 with SMTP id t1mr1492450wbu.105.1295477015752; Wed,
	19 Jan 2011 14:43:35 -0800 (PST)
Received: by 10.227.151.208 with HTTP; Wed, 19 Jan 2011 14:43:35 -0800 (PST)
In-Reply-To: <AANLkTikUOPo2v+=qYF_afhSHxkyb1EK3HJC1_E4RRGub@mail.gmail.com>
References: <4D36F9BE.1010601@xora.org.uk>
	<AANLkTi=sJGSCRxSF6tFPhrGb=NKfmiLNURg-n-Gmgc3Z@mail.gmail.com>
	<4D370A54.6020607@xora.org.uk>
	<AANLkTikUOPo2v+=qYF_afhSHxkyb1EK3HJC1_E4RRGub@mail.gmail.com>
Date: Thu, 20 Jan 2011 09:13:35 +1030
Message-ID: <AANLkTik3ysHryPYNcpObiyky4X98=9exDyKtJD_3yu+k@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Wed, 19 Jan 2011 22:44:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 January 2011 05:22, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/1/19 Graeme Gregory <dp@xora.org.uk>:
>> Core should probably have a build bot which crunches a standard set of
>> tests on each commit so unlike OE currently people don't wake up to bad
>> day of debugging OE.
>
> I'm not sure if that is needed (at least not on for every commit).

Doing this for every commit may be good from the point of view of
keeping git-bisect useful.

-Graham


