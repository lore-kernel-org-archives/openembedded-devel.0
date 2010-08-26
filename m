Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OobA6-0004re-1v
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 14:02:30 +0200
Received: by iwn2 with SMTP id 2so1481232iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+mLcK2dE07ZpZBS/hl/O2opfudIbcxYTolG075ISEEI=;
	b=sQTVrCaCHbOIxaf0tQdZb+k6gRHxxB2wWmHtUh1roGadzobrPr8RDJPJdVITdopnAt
	eGZGrzuB9NT76yq71VwHnNdeUK4oDPzhotJ6VwFP5WgThUod8nle3TvMTPPdmKOxc7qt
	ymQhcaY52Gjl13fUICMz7yWqwBSuI9rnh/q9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=odpVFwhmpFcvpfP02PuxsniPrvfVNBPBnb/Kc6Gc6+uOVDFGjeEHAaH+1b2+O82y7k
	5c3FMLyCZdEQ3+moL4Bi9kbHPMpU+ihQuUM0f6zQSclt7C86+SvaoXtao8TaVZ/WS0bV
	a5VIHydQvOFvFSrIvqYG/RnaNhlaoKyl9Yipc=
MIME-Version: 1.0
Received: by 10.231.59.15 with SMTP id j15mr11969247ibh.172.1282824123586;
	Thu, 26 Aug 2010 05:02:03 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 26 Aug 2010 05:02:03 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4575@deimsg40.de.net.world>
References: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
	<AANLkTikXMR7j0r20XWCdMpDa69P92m6wbPLZVNH_Nob_@mail.gmail.com>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4563@deimsg40.de.net.world>
	<AANLkTinFzZ=eTH0yvg=8Dp=-+J_1N9U0gKcOQm8QSV+h@mail.gmail.com>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4575@deimsg40.de.net.world>
Date: Thu, 26 Aug 2010 14:02:03 +0200
Message-ID: <AANLkTi=XKe+-=d8o3511PMtfBeOijE-jfoZQazY=jq-N@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Patch procedure for dummies
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
X-List-Received-Date: Thu, 26 Aug 2010 12:02:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/26 Hauser, Wolfgang (external) <Wolfgang.Hauser.external@eads.com>:
> In an earlier mail, I was told that it doesn't matter for patchwork if a patch is sent as an attachment.
>
> We are pinned on Outlook here and webmailers are filtered out by the proxy, so I need to send patches via Outlook.
> Easiest way in Outlook is an attachment.
>

I'm not sure what patchwork does, but it could well be that the
mailing list itself filters attachements.
I don't think I have seen attachements on this list (but I may be mistaken).

Frans


