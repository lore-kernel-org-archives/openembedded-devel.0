Received: from [64.233.182.190] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L9nFk-0004Sw-Hv
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 22:02:52 +0100
Received: by nf-out-0910.google.com with SMTP id d3so701769nfc.20
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 12:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=kyZ8sXCOknitP1XoEHquoRLr1kOWtKZ07Dh9zZowuM8=;
	b=rcSJlbiElueAyS7FEKkF7hpvKyWBAKIdJKq04dPI0x58z3fNA/Gt+l2QfMlKi2xy6E
	2s0VF6ba3fXXBgJG1RXN3eQpr08SxnwJHM3zuFOCcu1HeXgnaFLZAccWnOnMxYRuIN2i
	4fgN8WQlBtvSEcuHKwqPmGcwetFELjQ9MCsz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=C18wGRFtCyDoMmEabWGOzFmzYwHHt2RCD3WHe2H5OYOpUTFbrcbNoPCKQwgRJ6y7E5
	O3uzOwazR1a+491dEi7O8lJ1DdHp3hpXTib02U9goe/TqKpxallNexdy5eXqrRh2gijm
	F7IP/Ywz2fU9Cvu4M5jutULuoT+1gOF0EUkoU=
Received: by 10.223.106.142 with SMTP id x14mr1639724fao.23.1228769939387;
	Mon, 08 Dec 2008 12:58:59 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Mon, 8 Dec 2008 12:58:59 -0800 (PST)
Message-ID: <c384c5ea0812081258oda439dap33f989fb61354e4@mail.gmail.com>
Date: Mon, 8 Dec 2008 21:58:59 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ghjvfm$opa$2@ger.gmane.org>
MIME-Version: 1.0
References: <c384c5ea0812081135l44781a3fw1a43dba861a44f0f@mail.gmail.com>
	<ghjvfm$opa$2@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: OE buildable on headless hosts?
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
X-List-Received-Date: Mon, 08 Dec 2008 21:02:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Mon, Dec 8, 2008 at 9:19 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 08-12-08 20:35, Leon Woestenberg wrote:
>> How many people are building GNOME/X stuff on non-X hosts (such as
>> Ubuntu Server)?
>
> Both my build machines are headless, but do have some x11 stuff installed.
>
You are correct and I should have changed the subject.

I have started to fix some issues locally, but run from one problem
into the other, not quite sure if they are all host-deps...

http://bugs.openembedded.net/show_bug.cgi?id=4916

Regards,
-- 
Leon


