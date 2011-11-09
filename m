Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1ROCYe-0000v7-GI
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 19:07:32 +0100
Received: by wwf27 with SMTP id 27so8240426wwf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=qDDm35RYheb48TPXidQdzJqq9aRa70SZn69dZcnT1NY=;
	b=eZVs12Bm31ltW2JUpP6sfSnFXaZL01AbQTsMbp7wYhtSWVHtj/SjUHaXB1BPPGyad7
	CpUKPiGY5fahF90UXY9C+FM5shCYh+BaqiXMK4Js04QfappKWWhTxyxPH/BjzTGOevZA
	SbNewgXDbwTvVYq9dL74ontxo62fet8wDfR14=
MIME-Version: 1.0
Received: by 10.216.135.168 with SMTP id u40mr5373476wei.100.1320861676801;
	Wed, 09 Nov 2011 10:01:16 -0800 (PST)
Received: by 10.216.3.3 with HTTP; Wed, 9 Nov 2011 10:01:16 -0800 (PST)
Date: Wed, 9 Nov 2011 21:01:16 +0300
Message-ID: <CAFZPMoZ-RczjH9HROM7=Fs9wy6+r-XgsDbm_ASsp=wNehvfd4w@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: gpsd + scons
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
X-List-Received-Date: Wed, 09 Nov 2011 18:07:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!
have anybody tried to update gpsd for OE?
They transferred to Scons and it seems to be extremely
cross-compile-unfriendly and OE-unfriendly.

Thanks a lot,
S.


