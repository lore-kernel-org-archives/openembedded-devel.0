Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ppqf5-0004Vh-2a
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:19:57 +0100
Received: by iwn8 with SMTP id 8so1833259iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=2kxusOKfEtHS2cdHW73mBapAsFXUqvfnNd2UoBvKRY0=;
	b=O41TZI/en6jZuNA/wpMGvx1MkoNH2PIc8pne/SxyLtlZOH8h1W4KP8n6mEqzEU9ENW
	Lh5LwA6D0xu89GMipT+vjudsgOXJVEC/T1UTHCQFcIeh3HLa1fu1inbT2KaGaHf+rb2y
	jq8V4EGSkmOG3z9qt1JM70BdzY0Gq0tDNTfB4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=J8d2V/bmW2Dfnu1VhWCjqMhZZK7vU/pl1lAKNOoNSbZDZAa2sbEKOKQ3R2kQ4Jj08s
	rpjjrgJY7EEKAszEe1HqtcyUxMcD7vfworHQJacRbwaypLK2YzKdG4fdviRcHAGGO6Kj
	R02E8QWzXdGtaqaMxHZ8pcXreoSdXX8jbky/Y=
Received: by 10.42.166.68 with SMTP id n4mr1749137icy.103.1297898322958;
	Wed, 16 Feb 2011 15:18:42 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm191996ibg.3.2011.02.16.15.18.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 15:18:41 -0800 (PST)
Date: Wed, 16 Feb 2011 15:18:45 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20110216231845.GX14525@sakrah.homelinux.org>
Mail-Followup-To: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-2-git-send-email-otavio@ossystems.com.br>
	<20110216230438.GQ14525@sakrah.homelinux.org>
	<AANLkTi=3FiQZFfdXX0jxRm=EN3qEqDGdG9X5SU9=p4aP@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=3FiQZFfdXX0jxRm=EN3qEqDGdG9X5SU9=p4aP@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 02/13] python-dbus: update to 0.83.2 and fix rpath to use absolute path
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
X-List-Received-Date: Wed, 16 Feb 2011 23:19:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (16/02/11 23:14), Otavio Salvador wrote:
> On Wed, Feb 16, 2011 at 23:04, Khem Raj <raj.khem@gmail.com> wrote:
> > why is PR different then 'mlX'
> 
> Any specific reason to use mlX? Most recipes use rX so I changed it while on it.

thats been python's lingua I will leave that to it still it should have
started at 0

> 
> -- 
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

-- 
-Khem


