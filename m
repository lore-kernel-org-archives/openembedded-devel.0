Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1PuSWN-0008V3-7u
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Mar 2011 17:34:00 +0100
Received: from homiemail-a15.g.dreamhost.com (caiajhbdcaib.dreamhost.com
	[208.97.132.81])
	by hapkido.dreamhost.com (Postfix) with ESMTP id BC7CB1B734C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 08:30:14 -0800 (PST)
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id DAE1976C07D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 08:30:07 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=puSD+HX0dNIcSJ5+/I9bOj5NSNMRjFC3dR8oEcZyZhLq/p932lffgB7Kt439p
	Yo0YCnEdaU0sx4g/PZYY6p1jB0PMo6iBl1O9k7CH0puN0zM08ItEE8DikfCkZQgd
	M/+6axJsfnrnL7+KXRm1QRiODkeF2vIvpQP+yM06XOs4GE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=moxAh
	+y+0LLTd+TuCrXwB+Hf5f8=; b=bKym56nP+nxknGwCJZYds2zu5VNUrzc522e4q
	oQ7U7Au4lGgqI0VvRcjzOiknS3qyaEazXoPQtnL1jBShnPR6CXwYoz1oTSyGjKjD
	sWesg/s5A2B4CxhHsvVA3uc2CmRm+Tu4sRkmgv/H5E0/D4SpU4iO6e9slOzCtokA
	07ErDg=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id ABF1B76C07C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2011 08:30:07 -0800 (PST)
Message-ID: <4D6D1EEB.3030709@gumstix.com>
Date: Tue, 01 Mar 2011 08:29:31 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D64B565.3040006@dresearch.de> <4D64EB62.2080103@dresearch.de>
In-Reply-To: <4D64EB62.2080103@dresearch.de>
Subject: Re: NetworkManager-0.8.1 do_compile failed
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
X-List-Received-Date: Tue, 01 Mar 2011 16:34:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm having the same problem. Any idea how to fix this?

--
Neil

On 11-02-23 03:11 AM, Steffen Sledz wrote:
> BTW: This error also occurs when building angstrom-gnome-image. :(
>
> Steffen
>



