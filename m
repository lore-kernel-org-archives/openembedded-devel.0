Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1L38Rs-0007WV-SE
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Nov 2008 13:15:53 +0100
Received: by yw-out-1718.google.com with SMTP id 5so209137ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Nov 2008 04:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=3ptrwCcBF8EQdB69/Sx2YNBNQ5MWfVzkHn9w5piF3vg=;
	b=ZBVYUxHt7bnRP3FuqgPfP71PZoQ0ifH25pEZEEcVluClVr9AhxKUSu9zjD9r6xYZVb
	bAls2mfjqqfZTA2w+Q/Fh38yJ8UhX4L6BaT8UgYC1KIZgMaZvO5J7zg1ICmNqNKO8FOZ
	30HCVjXHL5uAPbFyrlhaujjJC0b8ZVVoBda4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Ee3WYM3ubJRSbxtQHK7obJ8rZ33Mc2gEewKwCIsfl9Z299UKJzvLzRcq6aC3378QmG
	34zICHISXmuc74QJdc6pUzgeqOp/ly5SHCcd+eZw7YTpMxMF5M5laBGZIJmPEbYYo0Sp
	/+FERLkuE3kpb0gh7AJQ6CAdYOLBZDPGwbBRY=
Received: by 10.64.180.15 with SMTP id c15mr1922217qbf.80.1227183199464;
	Thu, 20 Nov 2008 04:13:19 -0800 (PST)
Received: by 10.65.61.19 with HTTP; Thu, 20 Nov 2008 04:13:19 -0800 (PST)
Message-ID: <bdb0025f0811200413r625f4bdey269c95464e0a09b@mail.gmail.com>
Date: Thu, 20 Nov 2008 09:13:19 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200811200911.36299.openembedded@haerwu.biz>
MIME-Version: 1.0
References: <20081114142917.7ea1d6a5@elara.dyn.totalueberwachung.de>
	<200811151630.31515.mickey@vanille-media.de>
	<200811200036.57807.mickey@vanille-media.de>
	<200811200911.36299.openembedded@haerwu.biz>
Subject: Re: Commit access for SHR guys
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
X-List-Received-Date: Thu, 20 Nov 2008 12:15:53 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: base64
Content-Disposition: inline

KzEKCk9uIFRodSwgTm92IDIwLCAyMDA4IGF0IDU6MTEgQU0sIE1hcmNpbiBKdXN6a2lld2ljego8
b3BlbmVtYmVkZGVkQGhhZXJ3dS5iaXo+IHdyb3RlOgo+IFRodXJzZGF5IDIwIG9mIE5vdmVtYmVy
IDIwMDggMDA6MzY6NTcgTWljaGFlbCAnTWlja2V5JyBMYXVlciBuYXBpc2GzKGEpOgo+PiBMZXQn
cyBub3Qgc3RhbGwgdGhlIGlzc3VlIC0tIGFueSBtb3JlIHZvdGVzPwo+Cj4gKzEKPgo+IFJlZ2Fy
ZHMsCj4gLS0KPiBKSUQ6ICAgICAgaHJ3QGphYmJlci5vcmcKPiBXZWJzaXRlOiAgaHR0cDovL2Js
b2cuaGFlcnd1LmJpei8KPiBMaW5rZWRJbjogaHR0cDovL3d3dy5saW5rZWRpbi5jb20vaW4vbWFy
Y2luanVzemtpZXdpY3oKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QKPiBPcGVuZW1i
ZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZwo+IGh0dHA6Ly9saXN0cy5saW51eHRv
Z28ub3JnL2NnaS1iaW4vbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwKPgoKCgot
LSAKUm9kcmlnbyBWaXZpCklOZFQgLSBJbnN0aXR1dG8gTm9raWEgZGUgVGVjbm9sb2dpYQpCbG9n
OiBodHRwOi8vYmxvZy52aXZpLmVuZy5icgpHUEc6IDB4OTA1QkUyNDIgQCB3d3drZXlzLnBncC5u
ZXQK


