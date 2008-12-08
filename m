Received: from [74.125.78.150] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L9loy-0003OU-1h
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 20:31:08 +0100
Received: by ey-out-1920.google.com with SMTP id 4so495696eyg.6
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=HjNiRdJa+0SWul/tYkeFX4yVrwOd+AqNkfWctyofy0g=;
	b=RBmGd+2bx9q1htqwGkjdRA+NxjPeH1tsLkvDeJHyzXkH8Y5slURTJzN2HEQ/ZWMjKt
	KQvfUJnYcRW+tom2snZWNaaUPGVCsJg6KNc/mL4ZUK0HmdhHkUXcPRcvlEtZgAgJ5MrE
	zHHGMeu0DFmvG0TLPVZWaDpDZz6jXYKvMqfA8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=no4faby6O64AY+Qq9+yZ8I1sr4AyDTNHZWilf44CPu67l071alDe7uL62ZEuSrVh/p
	rcgDnuBYLpEsPAt6OL0Qc0SWvsBPM2CV3YTNVXMdPF5ATx/ug9GBaAzjJC0q+Wp4sIQJ
	wNN5Mrf90vd9jxyWyu1Xfw/oOdKJZs7mTXyQU=
Received: by 10.223.112.202 with SMTP id x10mr1554461fap.68.1228764435124;
	Mon, 08 Dec 2008 11:27:15 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Mon, 8 Dec 2008 11:27:15 -0800 (PST)
Message-ID: <c384c5ea0812081127u3fbffadeqb0bd1469db70c4dc@mail.gmail.com>
Date: Mon, 8 Dec 2008 20:27:15 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
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
X-List-Received-Date: Mon, 08 Dec 2008 19:31:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Koen,

On Mon, Dec 8, 2008 at 11:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Due to changes in how bitbake handles environment vars ANGSTROM_MODE has
> been renamed to ANGSTROMLIBC:
>
What is the causing change in bitbake?

Regards,
-- 
Leon


