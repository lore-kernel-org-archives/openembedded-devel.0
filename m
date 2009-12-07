Received: from ey-out-1920.google.com ([74.125.78.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHaoe-0007Ft-2z
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:27:43 +0100
Received: by ey-out-1920.google.com with SMTP id 5so1063495eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 02:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=NHy8p7HnJ1woM4DAKpkDnBqL2r20+N66PQckQTfl8bM=;
	b=MC3PbcXL92KyPL1+XciD9suTzv93wyt7s7k0cNP6brDtVrj5hvXqIN0PONQMR6dcpO
	zjzFo5UqMaEpHdMhaiYAL14v9NFbu6xae+wJQ1VwWT9bpJxv7xTK/ZvsybCokgYypu6R
	vCagp4ZzZNpbbQtIR+kAJkDQRbD9lnConBAWA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VN57dWvyrpVOb8nAj5Nd5Q7hyYd9A03KudzbRs/VipcQHRLX3qJx6SJqBTViC31fho
	bGMdvkyzl/gmOqla/K8fJVJlJbg0S9eFEY8d0p01bcw9riXaHmTbuU30Xf/yLU8YfRny
	13BwBtgVcxtcwODIfGDbga4SXa7VJOwobNyfs=
MIME-Version: 1.0
Received: by 10.213.25.79 with SMTP id y15mr6910970ebb.78.1260181562656; Mon, 
	07 Dec 2009 02:26:02 -0800 (PST)
In-Reply-To: <200912070921.27555.marcin@juszkiewicz.com.pl>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<200912070921.27555.marcin@juszkiewicz.com.pl>
Date: Mon, 7 Dec 2009 11:26:02 +0100
Message-ID: <c384c5ea0912070226h5a7720f8y38e07350978b48fa@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] cyclone3_starter.conf: New machine/board for architecture nios2.
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
X-List-Received-Date: Mon, 07 Dec 2009 10:27:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Marcin,

On Mon, Dec 7, 2009 at 9:21 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
>
> Do not use underscore in names as this conflicts with OVERRIDES.
>
Thanks, will be fixed.

Regards,
-- 
Leon


