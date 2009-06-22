Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <acassis@gmail.com>) id 1MIiTZ-0007Fy-K5
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 14:18:17 +0200
Received: by yw-out-1718.google.com with SMTP id 5so1403075ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JBEiQOWt1HIvgYX3CK7ghC+m5s7EhHMhyVzzMT/gOVw=;
	b=Nq0n83YizUKosy5CslL2Q7V3v+lF+/7R1CAdIszIE2aezTKaWd2hDc8ecZQt/icysu
	kdiHcPAgH9JEZPdSbsPwojkMU838upGtpgbHvuQI/d8AykFHjE1DTLhFXbjkw0HNQwPR
	SufpngzNvaeUxqYThZ3hrxFkHF1Mmr21sdW5M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KhSvnQLckIZ7CLo9cjQWJLRlJV/zTYJibEXhGAF+aQHzt4oVY6pYTri1cmSHU2s7IV
	NY0GaBJkqQROA/qQZbE/E+VHaRCKSoO4jLMx1Y5QGr2z7E4ZWISBLboo9SkZFybAtHl0
	cYx34sv0XfYuHMgZCPh8AJt12p5cBoECfNs7k=
MIME-Version: 1.0
Received: by 10.151.153.8 with SMTP id f8mr11171851ybo.343.1245672440297; Mon, 
	22 Jun 2009 05:07:20 -0700 (PDT)
In-Reply-To: <h1e5il$snr$1@ger.gmane.org>
References: <37367b3a0906181219s4fc7f87cic3ca34d596fb6150@mail.gmail.com>
	<h1e5il$snr$1@ger.gmane.org>
Date: Mon, 22 Jun 2009 09:07:20 -0300
Message-ID: <37367b3a0906220507m50134694m48893c9176d6a04e@mail.gmail.com>
From: Alan Carvalho de Assis <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] Add basic support for i.MX27ADS board
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
X-List-Received-Date: Mon, 22 Jun 2009 12:18:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 6/18/09, Koen Kooi <k.kooi@student.utwente.nl> wrote:
<sic>
>>
>> Signed-off-by: Alan Carvalho de Assis<acassis@gmail.com>
>> ---
>
>>   contrib/angstrom/sort.sh                     |    2 +-
>
> Awesome! Save's me from having to update it :)
>

Thanks to "git grep" :-)

BTW, Could someone apply it?

Regards,

Alan


