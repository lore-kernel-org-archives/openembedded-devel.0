Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3A84965E00
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 09:11:12 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so6178616igq.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 02:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=cIedbxDC+fx/sD0DAr1C1chfiUJZ8LaTUWNaC18Z+vU=;
	b=aX49N2tuAF5DvLpaJwDP/6vkKLRx+g8RYa/rXjarcw+TCjBeOqtgpWWj7ueolF69C+
	iBsY1/MJ/CzJABpqilSLGhKYPDVLaBYmR+As3It/fkvBag1QXdCwyeW0PvvDvRFAoWk3
	RBzEmZEcYcvqBEQAR+OO4PDrFYsrMsl+M6q+tK0qhdLpMCNERPlWu7jMCdag6rDT/U5U
	3AMadEX3f1/Qtm2mJU4iZ8E4OWmKrSyIc8zgASS7pVNv/mqpL0nnyybwKJroX8wFQiDS
	Hnpi5xoAGRCt64uxGHIanum7NYoM896Wc1zL4bhHtvjsjcUamYEtS2Nk0ZWEDGK+sZcu
	dvlA==
X-Gm-Message-State: ALoCoQmtd9wzLEtiKLDUjT6ekshQfY6IIB/Ij3NA4B7O8NEzqrqfwJMmYoWwquk0InQoolJkhe0T
X-Received: by 10.50.62.104 with SMTP id x8mr9102833igr.37.1397034673569;
	Wed, 09 Apr 2014 02:11:13 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id l7sm10042045igv.4.2014.04.09.02.11.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Apr 2014 02:11:13 -0700 (PDT)
Message-ID: <53450EB0.6070205@linaro.org>
Date: Wed, 09 Apr 2014 05:11:12 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <53450A23.3060107@linaro.org> <53450C29.5060202@digi.com>
In-Reply-To: <53450C29.5060202@digi.com>
Subject: Re: checksums for multiple sources
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Apr 2014 09:11:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 04/09/14 04:59, Mats Kärrman wrote:
On 04/09/14 05:00, Javier Viguera wrote:


Great! Thanks to both of you :-)

