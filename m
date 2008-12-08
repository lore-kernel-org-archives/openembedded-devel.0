Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L9pir-00073H-OT
	for openembedded-devel@openembedded.org; Tue, 09 Dec 2008 00:41:05 +0100
Received: by rv-out-0708.google.com with SMTP id k29so1593664rvb.0
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 15:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=wFUEMWjT0hIqoVlZ9le1JRX4TqHw78sF+kqsHSgntiE=;
	b=ulrfs0sq6q88T+z6X8iqQi/y9gJEkS1UPsQr38pWGUglK+83IDFn8TLiUN6nQhZvYS
	KqmWOmrrvka4bG5UB9TCx6kvKSaCGzYBXW1fKnsPHVqXM5asUhoRb83qXC94/A/h1ORS
	0QD00b7DabMMk2zpMOQ8+sr05tScWvnXaG5+s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=xHgLLFHUyYITHsklz3t4HvYVJa/jh8E7K0l8PV50JLkbuT54wCA6G+qpl6LUQpkCVP
	5wYSXIgQ4D7b3u5Mve1p2bjY7/Trk9TuuaRddPzaZ+BZwmmTng6AoDFJeXyHkLk8YgNU
	AXf0zoHDK6GbNLmnau5gq+6I9QKq8raJK/zbY=
Received: by 10.141.34.12 with SMTP id m12mr1432641rvj.176.1228779431524;
	Mon, 08 Dec 2008 15:37:11 -0800 (PST)
Received: by 10.141.171.13 with HTTP; Mon, 8 Dec 2008 15:37:11 -0800 (PST)
Message-ID: <19c1b8a90812081537j39e098d6w9e8f0a8c1b9c2b7@mail.gmail.com>
Date: Mon, 8 Dec 2008 15:37:11 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ghithj$qk7$2@ger.gmane.org>
MIME-Version: 1.0
References: <ghithj$qk7$2@ger.gmane.org>
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
X-List-Received-Date: Mon, 08 Dec 2008 23:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Dec 8, 2008 at 2:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Hi,
>
> Due to changes in how bitbake handles environment vars ANGSTROM_MODE has
> been renamed to ANGSTROMLIBC:
>
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=325476d19b821623dbe151d7026c20dfd3754432
>

For me ANGSTROM_LIBC would have been more readable. but I can live
with whatever is there

-Khem


