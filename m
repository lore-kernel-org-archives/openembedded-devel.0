Return-Path: <moritz.fischer@ettus.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF1873172
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 13:56:43 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 123so133773479wmz.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 05:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NS8+TbC/7mmsKc7dyXR7A/Bl/tp9BqFnfgAnyibzl3s=;
	b=N7I4cfrZEVPI2Xw3atbbTMch1gauqYaQFK7Ez4h3DcFl7lGilf0zV+nIanQy/xhtkt
	C40n4Yd9cDhy1kzW6yWgHRP3ANE6SglC8KtpGwbEQYg2DBwnmILiXPBTu4KpkfVtonRM
	PD3wInEcUARms40KooZAHhI6KUVtwHRdDZCYOoEt+Mj052CS8SN7nw+Y0lWN+5zyIBCT
	/YaWDtTXz6bLV81w7+oz5nMEk5gpJwB30wobm/wKkIkLO/8peL/yTVaQrOVVwn7NhSLU
	vfO7G6b7/+ppslsN678zUxlHh34IsZ7RTEmJs1eRWECZH1eJGvkZOMLcp0OdKpfqnZGO
	bDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=NS8+TbC/7mmsKc7dyXR7A/Bl/tp9BqFnfgAnyibzl3s=;
	b=j67oikgbiST899BLrhbuoG4Xc78GKK8ZJNd7s+gi78i9bCZTkZ3eA138b3k6SAiheX
	Uw+CBAivRg9fQFvmz4JxwL/cmEUP79laju6tHK2DDU89hZeUwCNyE9PJzWiiNGAg7Yku
	1X5BcP3ECiUJ5g5zIafBhGoz3Dgmg66Ra5LdOQO+VQYBtaOMcjfHSr6xxuGxUQtVgPs7
	1SyckbOKFPuS7qjIRVhlxSO0c4eUeLTcBXYHTif8S/WY0vD/kf5tSAGXXo+pAX096Km5
	odSYlB0gNxOO5zBxXo9qS8pbUfSB/+bfxcNOOuRa9Puev69pOgJSoBSjxKlZGmsSPBj1
	qpCA==
X-Gm-Message-State: ALoCoQlf/cT9BonCmkPneeqtvZrNv5aiP7CRYNbiIB4E10OvAQ3L5It3ZwF1FFjnOGwnWrPYI2/QwSTz+4jFjbWsCs1go+5eXTDUW+yJnEMU4nQNB3M37Q0=
MIME-Version: 1.0
X-Received: by 10.194.110.106 with SMTP id hz10mr36392886wjb.135.1453298203179;
	Wed, 20 Jan 2016 05:56:43 -0800 (PST)
Received: by 10.28.137.72 with HTTP; Wed, 20 Jan 2016 05:56:43 -0800 (PST)
In-Reply-To: <1452197854-12728-1-git-send-email-moritz.fischer@ettus.com>
References: <1452197854-12728-1-git-send-email-moritz.fischer@ettus.com>
Date: Wed, 20 Jan 2016 14:56:43 +0100
Message-ID: <CAAtXAHer2aQjARHBa=7KQNQzuYJsnThii=_GgRsOC5BiGB2PZw@mail.gmail.com>
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2] gpsd: Add patch to fix broken ACTIVATE hook.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jan 2016 13:56:43 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

do you want me to resend, is something still missing in v2?

Cheers,

Moritz

