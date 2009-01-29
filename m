Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1LSSee-0005ay-Gd
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 09:53:45 +0100
Received: by yx-out-1718.google.com with SMTP id 4so3034596yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2009 00:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Gn61+fs/oCIxeMbOrKufAp3lQFZfNyTmC9zN0JKAnV4=;
	b=csaX5cbnVAalV6XXPwb5sS9ztedbCd68SVWG2Y2SPM9cRofQ3hRQlX+8U7yOmt6LAA
	ABYrWRcGHz2/6GF1YHfrxLmcFLef+QxKhLf8pEN7V3PS+MzVL3mIAXjjiUf9ivJR1pHd
	gwydsgujNm+tWEQP+QugJ3cVfHI0Ld5QpZV2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=kxtrxShxnPQ0c0kReLjy94itR9YE9udx0gtxo7NIhBjGL5alWfujSQ3RJt6CL4ELzg
	eHLf4hiCY4wspzpkt/rFwT4dF8b+ntxjwTvFBh+5YIctralByEBIWu1L2r+BTC045ttg
	8HHRzuWicPLWtu8wMtGOVW49LoPgYwlFRigRE=
MIME-Version: 1.0
Received: by 10.150.97.20 with SMTP id u20mr2552997ybb.64.1233218764045; Thu, 
	29 Jan 2009 00:46:04 -0800 (PST)
In-Reply-To: <bc64b4640901290039g76152012na95522723349968c@mail.gmail.com>
References: <48239d390901282324j203a7111i6993ee223c12e109@mail.gmail.com>
	<bc64b4640901290039g76152012na95522723349968c@mail.gmail.com>
Date: Thu, 29 Jan 2009 11:46:04 +0300
Message-ID: <48239d390901290046ibe1040fvdd231f1a0428d808@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: maintainers for wireshark/tshark, net-snmp, libpcap, tcpdump
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
X-List-Received-Date: Thu, 29 Jan 2009 08:53:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> I have a set of patches implementing IEEE802.15.4 stuff, so these are
>> needed to be upgraded and patched.
>>
>> wireshark/tshark: buildability
>
> While you at at it,  could you please also bump the version of wshark/tshark
> to the upstream one?
'twas my initial intention, but it has some additional
cross-compile-unfriendly tests
which require some attention.


