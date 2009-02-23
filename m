Received: from [209.85.128.188] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1LbVYf-0006pv-2L
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Feb 2009 08:48:57 +0100
Received: by fk-out-0910.google.com with SMTP id f40so1327251fka.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2009 23:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iqaIZyUFLvVh/hmtGkkIYpwWGTTQpIcFwz47VUMa6aI=;
	b=rThIsyU0Me2cwfwpGK7VyR8EgokE+ujoBd2eVBIwRHuEL19NuxsWAEbkwa+6egUzHO
	k/FmEsZM7XTyWUo4+jEPrbrAcS4Wu7ER2Cri+SlfkhIgPujgw2IBfBU9pC7SqxXyFpEa
	dZdVkESTKf6KbBnMhx1VCjC1PbvEmuGszCyyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mNqgb+WiqBHBPjzix7WOcdWzEjr6iEQ7hHzG+nwSPTKvrqKoE15Btcxy+yIoT07IJ5
	PjrjHxKDSwglt6o8HWrM6LgC+vFBaEE6sbFdYq72SwkFZetOZOE39O73VaMHPqSDQNhA
	SdNke74YvPZyGTLELJJ1tclNhL2b5EmJRdrhs=
MIME-Version: 1.0
Received: by 10.223.105.9 with SMTP id r9mr494299fao.100.1235375166535; Sun, 
	22 Feb 2009 23:46:06 -0800 (PST)
In-Reply-To: <1235372951.19710.3.camel@ubuntu2>
References: <1235372951.19710.3.camel@ubuntu2>
Date: Mon, 23 Feb 2009 08:46:06 +0100
Message-ID: <5c5e5c350902222346n632f3598vbc3965761c58229b@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Machine for Dual Core
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
X-List-Received-Date: Mon, 23 Feb 2009 07:48:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, Feb 23, 2009 at 8:09 AM, Paolo Cremonese <pisa.t@teledata-i.com> wrote:
> what type of "machine" have I to use to build an image for a Pentium
> Dual Core?

i586-generic will run, is currently working (unlike AFAIK i686) and
could do if you're using it for tests

I'm not sure that OE/Angstrom would be suitable to be _used_ on such a
pc, however

-- 
Elena
email: elena.valhalla@gmail.com


