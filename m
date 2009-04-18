Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LvCfu-00021i-I6
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 17:41:50 +0200
Received: by yw-out-1718.google.com with SMTP id 9so918467ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2009 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dPPzruRfcEMTsUfBnyvk/5Tg4clWYnWvLaZSUuE6eGk=;
	b=mfK7LlW1ImFJZWdHwKTV0ersfgZrWdG2fyhlg6sdeZSs3RyyjSuchUvrhQiOyCtKAN
	6cA90l4L6fFts6DcYK+sO3jgdI4JCZOxSB8SSLsfhY2UExWOl4yOgVvksAEMSZP7/en7
	xN1cQTlL8/322uhFsQHMU193/Q4kOlwDsmHSs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m1hkCeGEN1JJAVUaqI5h1uEhMYr4rK2AorIg4PuLxLMbe/RrgKkRzZDJeW8mgmvVI7
	3Zca9DLkjHxA/TrZEuguQaITpsjWoQcJFT4IyD8XXCmnaY2cst5AGX9vepII7Au8xGZi
	o9a9bPq+Yr9IAjFWmLDrw6yDeNGI21TD0zjxo=
MIME-Version: 1.0
Received: by 10.90.72.3 with SMTP id u3mr838911aga.94.1240069063378; Sat, 18 
	Apr 2009 08:37:43 -0700 (PDT)
In-Reply-To: <20090416132114.GA6379@denix.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF75B@hiob.intern.dresearch.de>
	<gs6so4$8mb$2@ger.gmane.org> <20090416132114.GA6379@denix.org>
Date: Sat, 18 Apr 2009 17:37:43 +0200
Message-ID: <c384c5ea0904180837h158d76faw21c837dcac13293d@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: linux_2.6.24.bb: patch file unavailable
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
X-List-Received-Date: Sat, 18 Apr 2009 15:41:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Thu, Apr 16, 2009 at 3:21 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Apr 16, 2009 at 11:11:32AM +0200, Koen Kooi wrote:
>> On 16-04-09 10:51, Sledz, Steffen wrote:
>>
>>> Or should i upload a copy to the OE repo from my local sources cache?
>>
>> Personally I strongly dislike using patches from remote hosts, since the
>> get changed/deleted/etc beyond our control.
>>
Should we decide to police this one into a policy?

Squashfs 4.0 is indeed in mainline, we need to bring the new userspace
support in.

Not sure if the kernel fs is backwards compatible with the 3.x series fs.

Regards,
-- 
Leon


