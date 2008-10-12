Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KpAZc-0007yA-BL
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 01:42:08 +0200
Received: by qw-out-1920.google.com with SMTP id 5so403528qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2008 16:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=hUjcrjJ0InLPvDLubu12gxU0ObHPVnezXWLseTVuQMk=;
	b=lLHSASsaV5kQwK9RkjFJNyawv9GDEWcahMPlxgcLbiXWOpaB5VeHrDKhIETK6kDX53
	1jP+ouWN21bvy6ktpKB0jlugk+SARQCeXkNQg4Fa6GsxXJLst75AfsIyjc0zzOrC31PT
	uF3x3FENs0WJryjwQ0qNBNuhbPMeCfzOpEpjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=U/Ogp50bwBULa9uY93qY6Alr0Km3r45UW3u9DcScGC/ZtTJsFB5QYyHVEaWANVbPZI
	EyOVqNHT/kMqHf4H8wwWBPxR9lS4tDHlbA6VVVWueMJl7riUb3oOtk0nHuxbdb8WtGo5
	GDJigakjbpLySWLUtK+LefqAjZLLeXkGb7KRI=
Received: by 10.214.60.11 with SMTP id i11mr4071645qaa.59.1223854630693;
	Sun, 12 Oct 2008 16:37:10 -0700 (PDT)
Received: by 10.214.12.10 with HTTP; Sun, 12 Oct 2008 16:37:10 -0700 (PDT)
Message-ID: <c384c5ea0810121637q30dfeb17wbda7d82509d62205@mail.gmail.com>
Date: Mon, 13 Oct 2008 01:37:10 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810111447.57212.zecke@selfish.org>
MIME-Version: 1.0
References: <200810111447.57212.zecke@selfish.org>
Subject: Re: Final call for updating the name mapping script
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
X-List-Received-Date: Sun, 12 Oct 2008 23:42:08 -0000
X-Groupsio-MsgNum: 6174
Content-Type: multipart/mixed; 
	boundary="----=_Part_73939_10153130.1223854630678"

------=_Part_73939_10153130.1223854630678
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Holger,

merely changing my email address, which if I understand correctly is
OK, as its MTN key/author to GIT real-name/email address.

(the old email address is still valid in case this is not allowed).


Regards,
-- 
Leon

------=_Part_73939_10153130.1223854630678
Content-Type: text/x-diff; name=likewise.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fm8bcwrv1
Content-Disposition: attachment; filename=likewise.patch

LS0tIG9yaWcvZW1haWwucHkJMjAwOC0xMC0xMyAwMTozMTowMy4wMDAwMDAwMDAgKzAyMDAKKysr
IG1vZGlmaWVkL2VtYWlsLnB5CTIwMDgtMTAtMTMgMDE6MzM6MjUuMDAwMDAwMDAwICswMjAwCkBA
IC03MCArNzAgQEAKLSAgICAiTGVvbiBXb2VzdGVuYmVyZyIgICA6IChbImxpa2V3aXNlQGdteC5u
ZXQiLCAibGlrZXdpc2VAb3BlbmVtYmVkZGVkLm9yZyJdLCAibGlrZXdpc2VAZ214Lm5ldCIpLAor
ICAgICJMZW9uIFdvZXN0ZW5iZXJnIiAgIDogKFsibGlrZXdpc2VAZ214Lm5ldCIsICJsaWtld2lz
ZUBvcGVuZW1iZWRkZWQub3JnIl0sICJsZW9uLndvZXN0ZW5iZXJnQGdtYWlsLmNvbSIpLAo=

------=_Part_73939_10153130.1223854630678--
