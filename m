Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LlQjW-0004O7-RR
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 17:41:10 +0100
Received: by fxm20 with SMTP id 20so1384134fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YTJqLmf/O0AOnYSL4XH2eIr9kiETMFhXgTRKv7LG7Ac=;
	b=sSU4vA3u3GltFEwbtXsqKxVxL28bCImlW9ZR++yE/JgQkd3vDSHEVtv84Nuv1DQxyO
	3ztRUCqg/a4kw28bhC8538zPXVdiL8e4EL+WrB88JvcT8tHrMo9zP7TwMDSGkVJKZdNv
	qh3qPTQJlJgxOl+iEXplCXbioV7ypTTPJEBfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kl6mD9HFPyweSGijQi37v5qdL5Aa/LRrm6FV8falBaqr+M0v5ehAczS/8BOlZBTAIP
	fO5DU/m9+eunnUkyGX0yAInUAb00yoNm1rA7qOye3JRldLrErSIHbrzwvH+LBXKftBeP
	E2ubgZYoRJUkCcKRxEG5GTmgYTPWCUCbzIB+o=
MIME-Version: 1.0
Received: by 10.223.108.211 with SMTP id g19mr5189974fap.39.1237739992539; 
	Sun, 22 Mar 2009 09:39:52 -0700 (PDT)
In-Reply-To: <49C65016.4040901@balister.org>
References: <1237731142-8136-1-git-send-email-matthieu.poullet@gmail.com>
	<49C65016.4040901@balister.org>
Date: Sun, 22 Mar 2009 17:39:52 +0100
Message-ID: <d1b08f940903220939x3d2278ddyf670b973c793db5b@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Alsa-state: Wildcard removed and all *.state put back in the recipes
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
X-List-Received-Date: Sun, 22 Mar 2009 16:41:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

tested here. thx.

Acked-by: Andrea Adami (andrea.adami@gmail.com)


