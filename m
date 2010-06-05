Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OL0mV-0002px-K8
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 23:20:04 +0200
Received: by fg-out-1718.google.com with SMTP id 16so341162fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 14:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=tI7OHkgdT9mO1BOvKdBiBNOxGVBCm/tWbwJiiX50c4Q=;
	b=L8x5ZOmD6UTRxDnJQK1kwTfWq0AaVymUdBqprJpXmJFfTdT+KqahgCLEXyQO221q2i
	R213ytLrzuJdydrQnEOAf46J7NOBd3JiR5VbOazrx7MjFm/tlSXXRFWJYK92lImvKSys
	2FviZyV8Hq+290CRV92k3ZthWodXgmeBBFCg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=XCSqy38I10iOoIcJg5qQhv5mqAok6O/9Do4YfVHmbq9KPai3wzRS3VTKbB4Msnio1Y
	F8ggkHJn4Qoxy7nxOnQvdwDLynblFroM0s9Nqa4IC1MhHnCoPxU2eRFHHTBXA4yqwwFl
	Ni7Sa7Nn1WzS7se00AtqW3SACbkyDVXpm1o7c=
Received: by 10.87.1.2 with SMTP id d2mr19981070fgi.34.1275772535510;
	Sat, 05 Jun 2010 14:15:35 -0700 (PDT)
Received: from [192.168.5.27] (z0701.wist.uni-linz.ac.at [193.171.42.194])
	by mx.google.com with ESMTPS id c28sm3781372fka.44.2010.06.05.14.15.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Jun 2010 14:15:34 -0700 (PDT)
Message-ID: <4C0ABE75.8000004@gmail.com>
Date: Sat, 05 Jun 2010 23:15:33 +0200
From: =?UTF-8?B?TWF0dGhpYXMgR8O8bnRoZXI=?= <matgnt@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0992ED.6000102@gmail.com> <hue0a5$8e9$1@dough.gmane.org>
In-Reply-To: <hue0a5$8e9$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4 upgrade to 4.7.0-beta1
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
X-List-Received-Date: Sat, 05 Jun 2010 21:20:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2010 19:08, Koen Kooi wrote:
> On 05-06-10 01:57, Matthias Günther wrote:
>> Hello.
> 
>> I've been working with QML (Qt Quick) for some time now and therefore
>> I've created recipes for Qt 4.7.0-tp and beta1 versions. The patches
>> just disable the not cross compiling parts (e.g. some demos/examples).
> 
> At work I need demos/browser to show off some html stuff, do you have an
> idea what the effort would be to get it to build again for qt 4.7?

I'm not sure. To make it easy I just disabled the not important parts
where compiling errors occured. But I will have a look into it.

Regards,
Matthias


