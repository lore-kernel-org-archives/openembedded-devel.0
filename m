Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L9lre-00066W-08
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 20:33:54 +0100
Received: by ug-out-1314.google.com with SMTP id k3so709479ugf.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 11:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=l+gb5zqqzfQ4x85KRQnDcfJPALo+IUbMOUDCfWw1WkM=;
	b=Ni2oNP7oCvjvwQW2gLEShaj5u6F7i9Nj2VlpLa0Ob6Kw9IfxciNnErP4QbpySMj2e7
	U2iJKiT6rh9Le2ZPDIszYAmjoas+A6vjGgNN/AGHmMk9+RKXS6ad+B8Wj1UQKOugqqrx
	AhvtLtR7V3439G85k0f/ZZ1v83DB8BPcHuYck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=dkN/bdRiNPIfmiT9FKGdFjhn7a2uE/V3J9MNWspOrPLYqTYSChVgLh0zjWzuNXvsMK
	GHxVceFF1xSGRY/ZOi/tC8H+uxymj9wUGvLNkjBpdxqm2fsB/VSQxs5/CkJJTC+PFEOe
	gMrX0RCHy7t3lX5RGrB+jtHk705J6ctSCsASI=
Received: by 10.223.110.3 with SMTP id l3mr1539545fap.49.1228764595137;
	Mon, 08 Dec 2008 11:29:55 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Mon, 8 Dec 2008 11:29:55 -0800 (PST)
Message-ID: <c384c5ea0812081129yd635644na6a6edc7d05c956d@mail.gmail.com>
Date: Mon, 8 Dec 2008 20:29:55 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0812081127u3fbffadeqb0bd1469db70c4dc@mail.gmail.com>
MIME-Version: 1.0
References: <ghithj$qk7$2@ger.gmane.org>
	<c384c5ea0812081127u3fbffadeqb0bd1469db70c4dc@mail.gmail.com>
Cc: openembedded-devel@openembedded.org, angstrom-distro-devel@linuxtogo.org
Subject: Re: ANGSTROM_MODE renamed to ANGSTROMLIBC
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
X-List-Received-Date: Mon, 08 Dec 2008 19:33:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Koen,

On Mon, Dec 8, 2008 at 8:27 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> On Mon, Dec 8, 2008 at 11:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> Due to changes in how bitbake handles environment vars ANGSTROM_MODE has
>> been renamed to ANGSTROMLIBC:
>>
> What is the causing change in bitbake?
>
Sorry, disregard my question, I was reading my email in reverse time
order... This has been discussed on the ml already.

Regards,
-- 
Leon


