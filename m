Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1Ncboy-0005MU-6y
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 10:46:55 +0100
Received: by pxi9 with SMTP id 9so1161425pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 01:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=TA/Q9tPxc/X1vW3dsFyyhxyL7jSNo38wuiGE/C/gKcM=;
	b=u8mOMsbwokALMLBR6oLip7JJGfBhWCPCrnAxdvTPOrBYYigY7s/5cU2CQsy2H5mQRw
	BRP9D2hzawulQxqtUd+kyAi1fOmpd9Ol3dcVMRJygslXWxfIV2TVKwx1Aav65sIgqKKb
	ljBqdi5oQ8Yo3GmSiGn0xizSHU2AjBJyjDh5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XtGxdkxBr/562v0xaluYSPuwN6iwLv+r0jgUWgeA3hXpDMhdl/uuR8DH98cD3wGu6U
	EEnF2LHtX7KRVI6M5BcPM/bxJbb6ubgWXcesDn8zlsBPV0tMEHT8dnXaQjgFXv6qwW8D
	aXbIzo/NU7Fq4xK6SMT7OwU1QTVvRF6hL46Q8=
MIME-Version: 1.0
Received: by 10.114.3.2 with SMTP id 2mr4876414wac.156.1265190263651; Wed, 03 
	Feb 2010 01:44:23 -0800 (PST)
In-Reply-To: <mailman.775.1265186732.14961.openembedded-devel@lists.openembedded.org>
References: <mailman.775.1265186732.14961.openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Feb 2010 15:14:23 +0530
Message-ID: <ad82c8891002030144n2e661145xebf2601c0730503e@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Openembedded-devel Digest, Vol 43, Issue 10
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
X-List-Received-Date: Wed, 03 Feb 2010 09:46:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Dennis,
              The only thing i tested is trying following command  : *hexdump
/dev/input/touchscreen0* from the console of EM-X270 and i touch the
touchscreen with pointer for a couple times.  And i got output of hexdump
only after touching the touchscreen.I am actually accessing console of
Em-X270 through hyper terminal or minicom(115200 baud rate).
I don't no it is with tslib or Xserver, i am facing problem. I am quite new
to this.
Please provide me a details about testing my driver with tslib test utils.

with regards
vivek tambakad

