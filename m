Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1Q7uhb-0003m4-Oh
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 21:17:15 +0200
Received: from homiemail-a75.g.dreamhost.com (caiajhbdcaid.dreamhost.com
	[208.97.132.83])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 3810A17BD74
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2011 12:15:04 -0700 (PDT)
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id 2461A5EC084
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2011 12:14:54 -0700 (PDT)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=GMyeKkjYEItTmOXw7SDLIxKj6/dc0oA6/dvHiwrUEFEfjAZdjeGDyORcnMHf1
	Sa1LJPmMTTlO/24w+HqleG0U+inLC6h0godL3yhhbDfz6XpfpZ/LsplyBsnCzNgK
	lj1URMYC1gqq6EIPL3SItIZZm5FojFw2pX2T9a/1sZW/XY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=tbPTz
	4Kl9/Pf24GxYgViGZwHkS0=; b=Qbx/2/vHG10+yJOUEDP4O1qG4EYXRGD+DWNJY
	t/devn6tAub0feAvvKJQ4e+wt1mlyGQGMET9ulR9GWcKPplRRrJwq5T3LmWKmOnH
	kbssisyy+4wg6l99VP5Q3KTdlPdt/YYHAhDn6aD0a6tIrRNhcXXpkQ++vpNPlkGL
	SWX60U=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id 05C155EC080
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2011 12:14:53 -0700 (PDT)
Message-ID: <4D9E0D31.6090403@gumstix.com>
Date: Thu, 07 Apr 2011 12:14:57 -0700
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D9E04ED.4000102@gumstix.com>
	<BANLkTikHnQ3HFfJ2RjasA20Z-8uOwM0F6w@mail.gmail.com>
In-Reply-To: <BANLkTikHnQ3HFfJ2RjasA20Z-8uOwM0F6w@mail.gmail.com>
Subject: Re: Portmap Install Permissions
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
X-List-Received-Date: Thu, 07 Apr 2011 19:17:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11-04-07 11:55 AM, Yury Bushmelev wrote:
> 2011/4/7 Neil MacMunn<neil@gumstix.com>:
>> I recently switched to angstrom-2010.x and now I'm running into what appears
>> to be a permissions issue.
>
> This is issue in bitbake master. Please use bitbake 1.12 as workaround for now.
>

Back in business. Thanks.

--
Neil


