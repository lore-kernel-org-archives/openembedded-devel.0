Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1RIPs0-0001B5-MH
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 21:07:36 +0200
Received: by bkat8 with SMTP id t8so8752802bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7/fWhzkeyLeWdTB9sYI8b03kEtqHXsPL8HaH9qn74uI=;
	b=MaUJ5cPpuO4N/3UecVV0ixK70HiPParvaBSP2z+Dr8CB9F24kEXlrHZ1FlZBA7GozQ
	8e7hzTH0/i7rJwzk5HyYZw0CaNQUWiDReUupMESO53T/ZIZg/YWi6O0BM7qT/3BngDf9
	IVHIoiU73rWCfi1LIz5fKI+YXmsSZO0gqxZMk=
MIME-Version: 1.0
Received: by 10.223.76.24 with SMTP id a24mr35678231fak.31.1319482899593; Mon,
	24 Oct 2011 12:01:39 -0700 (PDT)
Received: by 10.152.12.233 with HTTP; Mon, 24 Oct 2011 12:01:39 -0700 (PDT)
In-Reply-To: <1319443507.3844.9.camel@mattotaupa>
References: <1319427652-9401-1-git-send-email-joelagnel@ti.com>
	<1319443507.3844.9.camel@mattotaupa>
Date: Mon, 24 Oct 2011 14:01:39 -0500
Message-ID: <CAD=GYpbY0-6qRjGdpZoGGtf7i6vnK+-_-nxtNngN-amC9WNKiw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-oe] memtester: Import from OE classic
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
X-List-Received-Date: Mon, 24 Oct 2011 19:07:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

On Mon, Oct 24, 2011 at 3:05 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
..
> I fixed some of the above in OE classic. Please fix the issues mentioned
> above in meta-oe with follow-up patches.

Thanks for your review comments, I'll work on resubmitting a new patch
today with the suggested changes.

Regards,
Joel


