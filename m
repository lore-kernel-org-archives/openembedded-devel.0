Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1LSahy-0001BJ-Bf
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 18:29:43 +0100
Received: by yx-out-1718.google.com with SMTP id 4so8631yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2009 09:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1xVOvIvXJHUtVrmInNSVywNX3emHGI2Mz1Kxaps3rmg=;
	b=l3TJFlqeaecl1/VTheGR5LUm87xGzXnAn8h/ANGN3lceNqFf5G5lu5Sx5uLfCW64qr
	eQqZW+JxbnQYgIkJpTyI1e9WoIf93Aed8XiyX3DYElwOfgf+7QOBttQepA+YhdZ6+4n1
	3lRwKcrC8yKaPdUfOJhz0Bj1lyF0Ob3uxvR2o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=puiFjeJk9xlEOJ8+/S7t+XNrf0Mo8F8nmX1bfIhGPqannC1ekHb5DZX0mKpSVkHIj4
	+oeXyLWI9L8vbE2snez0MzpgrRZvGUNzbjuAMTw9aeXgW7N4uM7Kx0y3vYU8VyHHCyAb
	ynZZQcYtB4AZNmW5JldSFPQ47ejTiUbUWrBc4=
MIME-Version: 1.0
Received: by 10.150.134.21 with SMTP id h21mr303454ybd.89.1233249720260; Thu, 
	29 Jan 2009 09:22:00 -0800 (PST)
In-Reply-To: <glsnd7$kfi$1@ger.gmane.org>
References: <48239d390901282324j203a7111i6993ee223c12e109@mail.gmail.com>
	<glsnd7$kfi$1@ger.gmane.org>
Date: Thu, 29 Jan 2009 20:22:00 +0300
Message-ID: <48239d390901290922p1733d028rfe354ddc602b5dca@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 29 Jan 2009 17:29:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Thu, Jan 29, 2009 at 8:01 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 29-01-09 08:24, Sergey Lapin wrote:
>>
>> Hi, all!
>>
>> Is there any maintainers for the following recipes:?
>>
>> o.o.d/packages/wireshark/tshark_0.99.4.bb
>> o.o.d/packages/wireshark/wireshark_0.99.4.bb
>> o.o.s/packages/net-snmp/net-snmp_*.bb
>> o.o.s/packages/libpcap/libpcap_*.bb
>> o.o.d/packages/tcpdump/tcpdump_*.bb
>>
>> I have a set of patches implementing IEEE802.15.4 stuff, so these are
>> needed to be upgraded and patched.
>
> In the future please update conf/checksums.ini with the checksums for new
> packages as well.
Ok, sorry, will do.


