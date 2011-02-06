Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pm73E-0003HE-K0
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 17:01:24 +0100
Received: by qyk8 with SMTP id 8so783615qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 08:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=qgvypap3lPeVCgPNIfzib2wc5mf49Lu4T3XhksjVvtw=;
	b=nCsuJFCXOBIHP0VDW0rTMZF21zkvVffX6r4OZFwe2a9UFlrU+AbUwdyCBPhYVIGC8h
	SHFmAEqLNUjJ25s24mLGzaCCmzl/7VpQvK+TjK/isJRrJYgLg6BnpwbwXd5NLdbrKt9U
	RvP+NQbvJmiV4OoKzawNaCU2lxNdZdY0pl64I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Giti2ZCeM9FHAu/MrWEQdwB+e785TPhH4ik38DCrej0kYu90tghfTj0iEtbqZ84lq1
	0y+HFKxPo7enr9pvd/CIUshUlltFxQlBXsRsN+bqF43c78Yd35gH4u13szNxUf9JnzLK
	5JOuhu/uE394hVfplEj5Gw5v2nXkyRZV8wog4=
MIME-Version: 1.0
Received: by 10.229.27.80 with SMTP id h16mr10213307qcc.191.1297008024091;
	Sun, 06 Feb 2011 08:00:24 -0800 (PST)
Received: by 10.229.68.100 with HTTP; Sun, 6 Feb 2011 08:00:24 -0800 (PST)
In-Reply-To: <1297007807-3333-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1297007807-3333-1-git-send-email-filip.zyzniewski@gmail.com>
Date: Sun, 6 Feb 2011 17:00:24 +0100
Message-ID: <AANLkTinus=X9r1hHCSPngOi=1onWeZJgp9KogpuCB9am@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] apt_0.7.20.2: fixed compilation errors with gcc-4.4.
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
X-List-Received-Date: Sun, 06 Feb 2011 16:01:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/6/11, Filip Zyzniewski <filip.zyzniewski@gmail.com> wrote:
> Just like in apt-native_0.7.20.2.bb.

Sorry for a separate thread, it was meant to go as a reply for
AANLkTiknYT+Ds+0URZXr1+08=8LBD2ekiV2Ng3xP-QsV@mail.gmail.com, but I've
somehow misconfigured git-send-email and it did not ask me for the
message-id this time.

bye,
Filip


