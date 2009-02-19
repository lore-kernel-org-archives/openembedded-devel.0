Received: from [209.85.198.224] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LaDaT-0004Dc-CP
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 19:25:29 +0100
Received: by rv-out-0506.google.com with SMTP id g9so389503rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 10:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=F3FSoFIiaCneymd1CTq2YnO0Oopv+ndxpLjwnOWbAdk=;
	b=M+oZ4jZyyNDuMlfiZu8X66Naa4BsyH+ffhvqkSA77tU2PqzHBNQyp2ZGVLVqeKRIjh
	YfY4Dvv/I9RO9G7S0eiGJmqXoFesi9nmvODGMnkoVVKeTYyXWiGJx9R0DWDdNwPTBiBu
	OsCptEv3+FqRdoGmNQL/F3VFYwfMa3NyMT0Jo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PQ4Pvkesx8P42RqXGnJXEeMIhz663FtAlPlQJzLj1ldwb+9OyDjUYRrRCbkdlvfwne
	fG1Rf0aC3XMRXnLJIjPIUwbjkztDoqGs4/GihJdWhPfeeiK86VXnbz0MBLb9RN5PI7pp
	jvGZh4Gk0I2Ridj7D9aaf3yhhdT5fYbHtsQhQ=
MIME-Version: 1.0
Received: by 10.140.201.8 with SMTP id y8mr4484056rvf.126.1235067789473; Thu, 
	19 Feb 2009 10:23:09 -0800 (PST)
In-Reply-To: <499A180C.1070802@balister.org>
References: <499A0B64.2000303@whitby.id.au> <499A180C.1070802@balister.org>
Date: Thu, 19 Feb 2009 10:23:09 -0800
Message-ID: <19c1b8a90902191023t7be0d596saee298af835f9fb3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Commit message policy for new recipes
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
X-List-Received-Date: Thu, 19 Feb 2009 18:25:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Feb 16, 2009 at 5:51 PM, Philip Balister <philip@balister.org> wrote:
> Rod Whitby wrote:
>>
>> <http://cia.vc/stats/project/openembedded/.message/efeb91>
>>
>> Any chance the commit message policy could be changed such that commits
>> for new recipes contain a description of the software that has been
>> pacakaged?
>>
>> Then someone following the commit RSS feed can see interesting new
>> package descriptions ...
>
> +1, in the future I'll try and give a one or two line description of the
> software when I commit new recipes.

me too :)


